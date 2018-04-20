# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname='bmap-tools'
pkgver=3.4
pkgrel=1
pkgdesc="Tool optimized for copying largely sparse files using information from a block map (bmap) file"
arch=('any')
url='https://github.com/intel/bmap-tools'
license=('GPL2')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/intel/bmap-tools/releases/download/v$pkgver/$pkgname-$pkgver.tgz")
sha256sums=('0064891270c180c190f41925b0f6fb9cecac3056f1168d2592dbe90e5f226c0a')

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
