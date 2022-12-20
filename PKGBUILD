# Maintainer: ohli <olifriedrich at gmail dot com>
# Contributor: Manuel Reimer <manuel.reimer@gmx.de>

pkgname=librepfunc
pkgver=1.6.4
pkgrel=1
pkgdesc="a collection of common functions, classes and tools. Mainly used by w_scan_cpp"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/wirbel-at-vdr-portal/librepfunc"
license=('GPL2')
depends=('glibc' 'gcc-libs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wirbel-at-vdr-portal/librepfunc/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('04b4a112c15b75755af709461eddc893c05ac8749111c76a973d996a1e083d5a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
