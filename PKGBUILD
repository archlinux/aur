# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.12.21
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-21/ruffle-nightly-2025_12_21-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-21/ruffle-nightly-2025_12_21-linux-aarch64.tar.gz")
sha512sums_x86_64=(f1ca1f3fb30260cd6be8599065000547435ead3f209ab7b6b26c9a574d3ada84e809bfb5f79b2a8a3707ccaf62628a6eab9736fef361ceaa5db884faac17491c)
sha512sums_aarch64=(7d6bd76629c88510fe7fd7b136ce12e673a0f4c0c891c81a9433e00ee5d3543d9b3a100ab1d8b597df6b47012188c1b902eeaa07023131bff64dcfeacb906508)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
