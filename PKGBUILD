# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname='bmap-tools'
pkgver=3.2
pkgrel=2
pkgdesc="Tool optimized for copying largely sparse files using information from a block map (bmap) file"
arch=('any')
url='https://github.com/intel/bmap-tools'
license=('GPL2')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://github.com/intel/bmap-tools/releases/download/v$pkgver/$pkgname-$pkgver.tgz")
sha256sums=('cc6c7f7dc0a37e2a32deb127308e24e6c4b80bfb54f3803c308efab02bf2d434')


build() {
  cd $pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root=$pkgdir/ --optimize=1
  install -Dm644 docs/man1/bmaptool.1 "$pkgdir"/usr/share/man/man1/bmaptool.1
} 

# vim:set ts=2 sw=2 et:
