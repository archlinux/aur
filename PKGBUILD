# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname='bmap-tools'
pkgver=3.5
pkgrel=1
pkgdesc="Tool optimized for copying largely sparse files using information from a block map (bmap) file"
arch=('any')
url='https://github.com/intel/bmap-tools'
license=('GPL2')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/intel/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d410e2d97192d0fc2f88ef160a0bb6ed83fce99da97a606d7f6890cc654ec594')

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
