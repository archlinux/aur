# Maintainer: Technochips <thetechnochips at protonmail dot com>

pkgname=retro-imitator
pkgver=1.6.8
pkgrel=1
pkgdesc='6502-based retro system interpreter'
arch=('x86_64')
url="https://jroatch.nfshost.com/${pkgname}"
license=('GPL-3.0-or-later')
depends=('sdl')

source=("https://jroatch.nfshost.com/dl/${pkgname}-v${pkgver}.c")
sha256sums=('e59a7b69f16981004eaebcb011ec436dc3557357cc911dfa78c7a5ef4942807a')

build() {
	gcc -O2 -std=c99 -Wall -Wextra -Wpedantic -lc -lm -o ${pkgname} ${pkgname}-v${pkgver}.c `sdl-config --cflags --libs`
}

package() {
	install -m 755 -d "$pkgdir/usr/bin"
	install -m 755 -t "$pkgdir/usr/bin" "$srcdir/retro-imitator"
}
