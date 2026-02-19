# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.2.19
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-02-19/ruffle-nightly-2026_02_19-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-02-19/ruffle-nightly-2026_02_19-linux-aarch64.tar.gz")
sha512sums_x86_64=(e8a32186a618dd24c270d79c351ca56c60fb91da92302df55d8769ef18e886a4135c28465603b01304fb695c2ed0b5d01567baa517fc8363733e7d3a81d73b13)
sha512sums_aarch64=(e4ff840daf314dde7940898575f3ad18e37383bffe086cc358dc4a1a661def05f02315d6f3eb6331a83796de8b766fbf47c16a28077f15427a810f78452d2899)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
