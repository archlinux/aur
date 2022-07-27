# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname='bmap-tools'
pkgver=3.6
pkgrel=3
pkgdesc="Tool optimized for copying largely sparse files using information from a block map (bmap) file"
arch=('any')
url='https://github.com/intel/bmap-tools'
license=('GPL2')
depends=('python' 'python-setuptools' 'python-six')
source=("https://github.com/intel/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0658afb972e7221aa16fece3f84e29e5102e901c929253d7fb6040bde28243f7')

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
