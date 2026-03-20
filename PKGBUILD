# Maintainer: Marko Zivic <marko.b.zivic@gmail.com>
pkgname=endcord-lite
pkgver=1.4.0
pkgrel=1
pkgdesc="Feature rich Discord TUI client. Lite version without terminal media player."
arch=('any')
url="https://github.com/sparklost/endcord"
license=('GPL-3.0-only')
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
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 ./docs/commands.md "$pkgdir/usr/share/doc/endcord/commands.md"
	install -Dm644 ./docs/configuration.md "$pkgdir/usr/share/doc/endcord/configuration.md"
	install -Dm644 ./docs/extensions.md "$pkgdir/usr/share/doc/endcord/extensions.md"
	install -Dm644 ./docs/keybindings.md "$pkgdir/usr/share/doc/endcord/keybindings.md"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	# install -Dm644 endcord.myapp.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
    # install -Dm644 endcord.svg "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.svg"
}
