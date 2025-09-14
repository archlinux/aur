# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.9.14
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-14/ruffle-nightly-2025_09_14-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-14/ruffle-nightly-2025_09_14-linux-aarch64.tar.gz")
sha512sums_x86_64=(a12f597c1f3d207794846ca219a103793afa654db65d9d575d062b847ee9fd3a599bcd364df96ad90f7059de925d94e73891a14aaf1f26c48d57dcc0e95019b1)
sha512sums_aarch64=(4f921f012b655b4c0ccf25e41087e886d14f3a91fdffb8107cf2ea6710bcfda5c03a3a44218ea6600a9311f097e2d14b922a2ca9a4555bf92387d1d72dd3ed92)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
