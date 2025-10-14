pkgname=rash-sh
pkgver=0.5.3
pkgrel=1
pkgdesc='rash, the rat ass shell, is a rudimentary shell written in C'
arch=(x86_64 i686 pentium4 armv7h aarch64)
url='https://git.myriation.xyz/parker_macdonald/rash'
license=(MIT)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(869d19bf1d4be08855e9567588ae42dd3e152d8d8d31a3111d2f690a18587e9a)

build() {
  cd rash
  make DEBUG=0 CC=gcc
}

package() {
  cd rash
  make DESTDIR="$pkgdir" install
}