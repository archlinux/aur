# Maintainer: Technochips <thetechnochips at protonmail dot com>

pkgname=retro-imitator
pkgver=1.6.6
pkgrel=1
pkgdesc='6502-based retro system interpreter'
arch=('x86_64')
url="https://jroatch.nfshost.com/${pkgname}"
license=('GPL-3.0-or-later')
depends=('sdl')

source=("https://jroatch.nfshost.com/dl/${pkgname}-v${pkgver}.c")
sha256sums=('f0ff833a76a2d7b408c8f47bc70c2389822d12c19b5a1256595b11906c525249')

build() {
	gcc -O2 -std=c99 -Wall -Wextra -Wpedantic -lc -lm -o ${pkgname} ${pkgname}-v${pkgver}.c `sdl-config --cflags --libs`
}

package() {
	install -m 755 -d "$pkgdir/usr/bin"
	install -m 755 -t "$pkgdir/usr/bin" "$srcdir/retro-imitator"
}
