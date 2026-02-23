# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=unstickpixels
pkgver=3.0.2
pkgrel=1
pkgdesc="Screen loop to try to unstick stuck dots"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/unstickpixels"
license=('custom:ISC')
depends=(libgamma)
makedepends=('libgamma>=0.7.4')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(657e94753235201ae23929882c84d63a3a5c17cbecf14933d485aabc17e2bd4b)

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
