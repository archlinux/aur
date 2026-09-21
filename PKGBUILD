# Maintainer: Marko Zivic <marko.b.zivic@gmail.com>
pkgname=endcord-lite
pkgver=1.5.4
pkgrel=1
pkgdesc="Feature rich Discord TUI client. Lite version without media and call support."
arch=('x86_64')
url="https://github.com/sparklost/endcord"
license=('LicenseRef-SparkLost')
provides=('endcord-lite')
conflicts=('endcord-lite')
depends=()
makedepends=()
optdepends=('xclip: clipboard support on X11'
            'wl-clipboard: clipboard support on Wayland'
            'aspell: spellchecking'
            'yt-dlp: youtube support'
            'mpv: youtube in native player'
            'imagemagick: make notification images round')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname-$pkgver-linux.tar.gz")
sha256sums=('SKIP')
options=(!strip)

package() {
	install -Dm755 ./$pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/endcord/README.md"
	install -Dm644 ./docs/commands.md "$pkgdir/usr/share/doc/endcord/commands.md"
	install -Dm644 ./docs/configuration.md "$pkgdir/usr/share/doc/endcord/configuration.md"
	install -Dm644 ./docs/extensions.md "$pkgdir/usr/share/doc/endcord/extensions.md"
	install -Dm644 ./docs/keybindings.md "$pkgdir/usr/share/doc/endcord/keybindings.md"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/endcord/LICENSE"
	install -Dm644 ./com.sparklost.endcord.desktop "$pkgdir/usr/share/applications/com.sparklost.endcord.desktop"
    install -Dm644 ./endcord.svg "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.sparklost.endcord.svg"
}
