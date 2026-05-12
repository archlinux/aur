# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.5.12
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-05-12/ruffle-nightly-2026_05_12-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-05-12/ruffle-nightly-2026_05_12-linux-aarch64.tar.gz")
sha512sums_x86_64=(fe5e1769db12ab5e7e9e28b273b400c17e4cac24f8fb1ec56d278d87c133e8b11d456e21535d87e170dfe5ec1faf8bc3da7a110eadebd03cfc4c3a4bb3e7b4d3)
sha512sums_aarch64=(e1735a4f31bd09eb66329a3278d308c12d0a442609b60e0bec3ca41c15a3aaa3c0fb1498158ec33d670d6e8685166dc9949b1a754590ff63856fb607bc671692)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
