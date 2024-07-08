# Maintainer: Lancelot OWCZARCZAK <lancelot@owczarczak.fr>

pkgname=inochi-session
pkgver=0.8.4
pkgrel=1
pkgdesc="Application that allows streaming with Inochi2D puppets"
arch=('x86_64')
url='https://inochi2d.com/'
license=('custom')
provides=('cimgui.so')
depends=(dbus freetype2 gcc-libs sdl2 glibc)
source=(
		"https://github.com/Inochi2D/inochi-session/releases/download/v$pkgver/inochi-session-linux-x86_64.zip"
		"https://github.com/Inochi2D/inochi-session/archive/refs/tags/v$pkgver.zip"
		)

sha512sums=("84f7078b6b5827b391fabc74dbbca9f9e7c0d2be5b69ed063859ef9f4e9b269933e692e01e150947eac48a1a0fcbde986868a3806d669f9c3c33694a6973d9c3" "6293a10be202c6ce40f8688335cb2b853b37b999f0417f771927722c1356ff250c90fe4d9b36643a98c5d75a3bee33b1a751779c9cc2224a6617f7a6da09eb36")

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
