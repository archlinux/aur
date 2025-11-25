# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.11.25
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-25/ruffle-nightly-2025_11_25-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-25/ruffle-nightly-2025_11_25-linux-aarch64.tar.gz")
sha512sums_x86_64=(e7cf435dfe7b26842b732afbeed8f8a0f1cd9cc9b0654576ed0372762a90291bee4727378f551f34346b31266037becd01017d35df42fe6e9c7bbefe2e78c768)
sha512sums_aarch64=(fb2225167f9252004b3d3b10875868351e28d4101b17d3079624f725dcc2a0851a10d51d9df78292f69f22bd73ff363bb1a1e541bf42a80ce570deac4830f849)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
