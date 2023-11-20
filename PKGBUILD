# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname='bmap-tools'
pkgver=3.7
pkgrel=1
pkgdesc="Tool optimized for copying largely sparse files using information from a block map (bmap) file"
arch=('any')
url='https://github.com/intel/bmap-tools'
license=('GPL2')
depends=('python' 'python-setuptools' 'python-six')
source=("https://github.com/intel/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('bcbdf9461ea34b0e62fa533fba0f50ae87a76fffa33e8e3bcef3ef3e9ea851d0')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root=$pkgdir/ --optimize=1
  install -Dm644 docs/man1/bmaptool.1 "$pkgdir"/usr/share/man/man1/bmaptool.1
}

# vim:set ts=2 sw=2 et:
