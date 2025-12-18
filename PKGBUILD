# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.12.18
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-18/ruffle-nightly-2025_12_18-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-18/ruffle-nightly-2025_12_18-linux-aarch64.tar.gz")
sha512sums_x86_64=(6d496ba9c6b821142e32bc4451693dbac2c68c73ca73b671bc34502e0fb165409cb8b4b3a169e7883bcf796a8a8ca168dfa96613c03ff1c5790928af8949a181)
sha512sums_aarch64=(ddebe70169d6a894beb12735b7ba5876c29dacaa7797b8f8cea04c95cbd1129a4f057f44a58ab357ab06f64ea2e0fefebd28bc3ada262dbd46f4dda5f258fa53)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
