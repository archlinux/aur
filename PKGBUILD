# Maintainer: ohli <olifriedrich at gmail dot com>
# Contributor: Manuel Reimer <manuel.reimer@gmx.de>

pkgname=librepfunc
pkgver=1.1.1
pkgrel=2
pkgdesc="a collection of common functions, classes and tools. Mainly used by w_scan_cpp"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/wirbel-at-vdr-portal/librepfunc"
license=('GPL2')
depends=('glibc' 'gcc-libs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wirbel-at-vdr-portal/librepfunc/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3ccf92b8b6bcc9eb78cc8b67f000ac1f306aa752103c30b6b7b4b717a0f15514')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
