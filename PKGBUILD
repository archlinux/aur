# Maintainer: mekb https://github.com/mekb-turtle
pkgname=2048-terminal-git
pkgver=r4.d12e4d2
pkgrel=2
pkgdesc='Terminal 2048 game written in C'
arch=('any')
url="https://github.com/mekb-turtle/2048"
source=("2048::git+${url}.git")
makedepends=('git')
sha256sums=(SKIP)
package() {
	install -Dm755 "$srcdir/2048/2048" "$pkgdir/usr/local/bin/2048"
}
build() {
	make -C "$srcdir/2048"
}
pkgver() {
	cd "$srcdir/2048"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
