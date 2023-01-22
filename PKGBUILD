# Maintainer: mekb https://github.com/mekb-turtle
pkgname=mekfetch-git
pkgver=r20.9b87193
pkgrel=1
pkgdesc='Simple neofetch alternative written in C'
arch=('any')
url="https://github.com/mekb-turtle/mekfetch"
source=("mekfetch::git+${url}.git")
makedepends=('git')
sha256sums=(SKIP)
optdepends=('nerd-fonts: Nerd font support')
package() {
	install -Dm755 "$srcdir/mekfetch/mekfetch" "$pkgdir/usr/bin/mekfetch"
}
build() {
	make -C "$srcdir/mekfetch"
}
pkgver() {
	cd "$srcdir/mekfetch"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
