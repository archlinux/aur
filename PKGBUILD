# Maintainer: mekb https://github.com/mekb-turtle
pkgname=mekfetch-git
pkgver=1.1.1.r0.g9b87193
pkgrel=1
pkgdesc='Simple neofetch alternative written in C'
arch=('any')
url="https://github.com/mekb-turtle/mekfetch"
source=("mekfetch::git+${url}.git")
makedepends=('git')
sha256sums=(SKIP)
optdepends=('ttf-nerd-fonts-symbols: Nerd font support')
package() {
	install -Dm755 "$srcdir/mekfetch/mekfetch" "$pkgdir/usr/bin/mekfetch"
}
build() {
	make -C "$srcdir/mekfetch"
}
pkgver() {
	cd "$srcdir/mekfetch"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
