# Maintainer: Technochips <thetechnochips at protonmail dot com>

pkgname=retro-imitator
pkgver=1.6.5
pkgrel=1
pkgdesc='6502-based retro system interpreter'
arch=('x86_64')
url="https://jroatch.nfshost.com/${pkgname}"
license=('GPL-3.0-or-later')
depends=('sdl')

source=("https://jroatch.nfshost.com/dl/${pkgname}-v${pkgver}.c")
sha256sums=('f7e6daaa1597a3ab0fa592f8604cd4ce5f13dc8f89ddb43786b8cffc2114d15a')

build() {
	gcc -O2 -std=c99 -Wall -Wextra -Wpedantic -lc -lm -o ${pkgname} ${pkgname}-v${pkgver}.c `sdl-config --cflags --libs`
}

package() {
	install -m 755 -d "$pkgdir/usr/bin"
	install -m 755 -t "$pkgdir/usr/bin" "$srcdir/retro-imitator"
}
