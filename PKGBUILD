# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
pkgname=adobe-bin2c
pkgver=r28.4300880
pkgrel=1
pkgdesc="Convert to/Embed binary files in C source files, quickly and efficiently."
arch=(any)
url=https://github.com/adobe/bin2c
license=(Apache)
provides=(bin2c)
conflicts=(bin2c)
source=("git+$url")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/bin2c" || return 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/bin2c" || return 1
  make
}

package() {
	cd "$srcdir/bin2c" || return 1

	install -D "build/bin2c" -t "$pkgdir/usr/bin"
}
