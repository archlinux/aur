# Maintainer: ohli <olifriedrich at gmail dot com>
# Contributor: Manuel Reimer <manuel.reimer@gmx.de>

pkgname=librepfunc
pkgver=1.10.0
pkgrel=1
pkgdesc="a collection of common functions, classes and tools. Mainly used by w_scan_cpp"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/wirbel-at-vdr-portal/librepfunc"
license=('GPL2')
depends=('glibc' 'gcc-libs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wirbel-at-vdr-portal/librepfunc/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('cf44d9c2e70b06318eda5a6f9e0449f70d1ac71de577c3cc92f513893952a896')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
