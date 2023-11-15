# Maintainer: Lancelot OWCZARCZAK <lancelot@owczarczak.fr>

pkgname=inochi-session
pkgver=0.8.3
pkgrel=1
pkgdesc="Application that allows streaming with Inochi2D puppets"
arch=('x86_64')
url='https://inochi2d.com/'
license=('custom')
provides=('cimgui.so')
depends=(dbus freetype2 gcc-libs sdl2 glibc)
source=(
		"https://github.com/Inochi2D/inochi-session/releases/download/v$pkgver/inochi-session-linux-x86_64.zip"
		"https://github.com/Inochi2D/inochi-session/archive/refs/tags/v0.8.3.zip"
		)

sha512sums=("8e89c6880b158d5c8d5df95a2451a50a950247506725d5e987dc2e9cb0af9f1b83185ac4ae39cb542a0a56d7b4968b1008203ab0a98ef0aa3e70d5d3123ea33b" "342822cf923d21a348012251809bc42f7da15c856df73de3e8baa5e63b202c6a687744a9ef5b193a363df452bddae86b2f835aaea666796a9d4bf61e6b6cd059")

package() {
	cd "$srcdir"
	install -m 755 -D cimgui.so "$pkgdir/usr/bin/cimgui.so"
	install -m 755 -D inochi-session "$pkgdir/usr/bin/inochi-session"
	install -m 644 -D LICENSE-FreeType "$pkgdir/usr/share/licenses/inochi-session/LICENSE-FreeType"
	install -m 644 -D LICENSE-imgui "$pkgdir/usr/share/licenses/inochi-session/LICENSE-imgui"
	install -m 644 -D LICENSE-Lua "$pkgdir/usr/share/licenses/inochi-session/LICENSE-Lua"
	install -m 644 -D LICENSE-Spout2 "$pkgdir/usr/share/licenses/inochi-session/LICENSE-Spout2"
	install -m 644 -D MaterialIcons-LICENSE "$pkgdir/usr/share/licenses/inochi-session/MaterialIcons-LICENSE"
	cd "$srcdir/$pkgname-$pkgver"
	install -m 644 -D LICENSE "$pkgdir/usr/share/licenses/inochi-session/LICENSE"
}
