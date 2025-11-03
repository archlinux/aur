pkgname=rash-sh
pkgver=0.5.6
pkgrel=1
pkgdesc='rash, the rat ass shell, is a rudimentary shell written in C'
arch=(x86_64 i686 pentium4 armv7h aarch64)
url='https://git.myriation.xyz/parker_macdonald/rash'
license=(MIT)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(2da125802a258727846587a90ab76d25334ef951376646a25e60cbae89566f7d)

build() {
  cd rash
  make DEBUG=0 CC=gcc
}

package() {
  cd rash
  make DESTDIR="$pkgdir" install
}