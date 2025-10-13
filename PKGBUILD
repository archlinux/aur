pkgname=rash-sh
pkgver=0.5.2
pkgrel=1
pkgdesc='rash, the rat ass shell, is a rudimentary shell written in C'
arch=(x86_64 i686 pentium4 armv7h aarch64)
url='https://git.myriation.xyz/parker_macdonald/rash'
license=(MIT)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(c07588181ab955389fa990f2b903a99de6f6e1d34e40e8c39fb5c051d8e4a46f)

build() {
  cd rash
  make DEBUG=0 CC=gcc
}

package() {
  cd rash
  make DESTDIR="$pkgdir" install
}