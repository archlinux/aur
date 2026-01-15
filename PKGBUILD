pkgname=rash-sh
pkgver=0.7.0
pkgrel=1
pkgdesc='rash, the rat ass shell, is a rudimentary shell written in C'
arch=(x86_64 i686 pentium4 armv7h aarch64)
url='https://git.myriation.xyz/parker_macdonald/rash'
license=(MIT)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(f4741d8787001b8d14368df90370523942c57134f8748d9d0099d53842bee01b)

build() {
  cd rash
  make DEBUG=0 CC=gcc
}

package() {
  cd rash
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
