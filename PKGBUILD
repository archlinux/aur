pkgname=rash-sh
pkgver=r138.9115e89
pkgrel=1
pkgdesc='rash, the rat ass shell, is a rudimentary shell written in C'
arch=(x86_64 i686 pentium4 armv7h aarch64)
url='https://git.myriation.xyz/parker_macdonald/rash'
license=(MIT)
makedepends=(git)
source=(
	'rash::git+https://git.myriation.xyz/parker_macdonald/rash.git'
)
sha256sums=(SKIP)

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd rash
  make DEBUG=0 CC=gcc
}

package() {
  cd rash
  make DESTDIR="$pkgdir" install
}