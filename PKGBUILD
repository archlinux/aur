pkgname=moroder-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="YouTube Music TUI with album art, MPRIS, Discord rich presence and minimal dependencies"
arch=('x86_64')
url="https://github.com/orrnithogalum/moroder"
license=('AGPL-3.0-or-later' 'LicenseRef-discord-social-sdk')
depends=('glibc' 'gcc-libs' 'mpv' 'curl' 'systemd-libs' 'libx11' 'yt-dlp')
provides=('moroder')
conflicts=('moroder')
options=('!strip')

_dir="moroder-$pkgver-linux-x86_64"
source=("$_dir.tar.gz::$url/releases/download/v$pkgver/$_dir.tar.gz")
md5sums=('639085820a0131a69d6291f35986bf9a')

package() {
	cd "$_dir"

	install -Dm755 moroder "$pkgdir/usr/bin/moroder"
	install -Dm644 libdiscord_partner_sdk.so "$pkgdir/usr/lib/libdiscord_partner_sdk.so"

	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 License-Notices.txt "$pkgdir/usr/share/licenses/$pkgname/License-Notices.txt"
}
