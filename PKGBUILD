# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.12.3
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-03/ruffle-nightly-2025_12_03-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-03/ruffle-nightly-2025_12_03-linux-aarch64.tar.gz")
sha512sums_x86_64=(931f15fe79c71f4a10af2bc2e5ad6b8fe5c14b44227cc9aa9f950e0f12eb486fb1496e5bac97dd71ab28630664b9e34da416045f971e166a51682d825fc46bf4)
sha512sums_aarch64=(5aa670d87df560e44cae9ac1cfb782acef9047a01aaad5247f348d339f1f149f9ba0326bdf057edb6bfe082b81007fe0c879472f478205e0c16cdd95b8d6e4bf)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
