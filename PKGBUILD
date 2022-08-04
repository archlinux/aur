# Maintainer: mekb https://github.com/mekb-turtle
pkgname=mekfetch-git
pkgver=1.1.0.r0.gf2736d9
pkgrel=1
pkgdesc='Simple neofetch alternative written in C'
arch=('any')
url="https://github.com/mekb-turtle/mekfetch"
source=("mekfetch::git+${url}.git")
sha256sums=(SKIP)
optdepends=('ttf-nerd-fonts-symbols: Nerd font support')
package() {
	install -Dm755 "$srcdir/mekfetch/mekfetch" "$pkgdir/usr/bin/mekfetch"
}
build() {
	make -C "$srcdir/mekfetch"
}
function pkgver() {
	cd mekfetch
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
