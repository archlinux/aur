# Maintainer: Paarush Senthilkumar <paarushsk at gmail dot com>
# Contributor: Lancelot OWCZARCZAK <lancelot@owczarczak.fr>

pkgname=inochi-session
pkgver=0.8.7
pkgrel=2
pkgdesc="Application that allows streaming with Inochi2D puppets"
arch=('x86_64')
url='https://inochi2d.com/'
license=('BSD-2-Clause')
provides=('cimgui.so')
depends=(dbus freetype2 gcc-libs sdl2 glibc)
source=(
	"https://github.com/Inochi2D/inochi-session/releases/download/v$pkgver/inochi-session-linux.zip"
	"https://raw.githubusercontent.com/Inochi2D/inochi-session/refs/tags/v$pkgver/LICENSE"
	"https://raw.githubusercontent.com/Inochi2D/inochi-session/refs/tags/v$pkgver/res/icon_x256.png"
	"inochi-session.desktop"
)
sha512sums=('129a9bd8b017778902dc94ccb58faf344236231526e305003283ced1778849bba787561ed73101ce20099dfdcc4a44e69164e808dacbf863d2fd4bd12aadad08'
            '44f274eead9606bd0674049debf99dedfcddcf670e8aa04d62d40a474905d63441feefc66451a2a202a1b7d2775cc1db070d3dee746220ef2b9bb006060e900e'
            '3966efc1b619624458c324eb4571f0ee515e90fece64ee956bf28c83c29eae8caa1b9e6e79b413905affc9f18201acbb428f3f78c7b3525c766b33e04efb7cef'
            'bc16bb739277b16b6ae1fe27ea45ae7e0362b5ab453054628a11ef3e2d65a3ad63d7aa1348fcf25c7d5d310646084e7591395e11e067156df607aa00166edd38')

package() {
	cd "$srcdir"
	install -m 755 -D cimgui.so "$pkgdir/usr/bin/cimgui.so"
	install -m 755 -D inochi-session "$pkgdir/usr/bin/inochi-session"
	install -m 644 -D LICENSE-FreeType "$pkgdir/usr/share/licenses/inochi-session/LICENSE-FreeType"
	install -m 644 -D LICENSE-imgui "$pkgdir/usr/share/licenses/inochi-session/LICENSE-imgui"
	install -m 644 -D LICENSE-Lua "$pkgdir/usr/share/licenses/inochi-session/LICENSE-Lua"
	install -m 644 -D LICENSE-Spout2 "$pkgdir/usr/share/licenses/inochi-session/LICENSE-Spout2"
	install -m 644 -D MaterialIcons-LICENSE "$pkgdir/usr/share/licenses/inochi-session/MaterialIcons-LICENSE"
	install -m 644 -D LICENSE "$pkgdir/usr/share/licenses/inochi-session/LICENSE"
	install -m 644 -D icon_x256.png "$pkgdir/usr/share/pixmaps/inochi-session.png"
	install -m 644 -D inochi-session.desktop "$pkgdir/usr/share/applications/inochi-session.desktop"
}
