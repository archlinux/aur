# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.11.11
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-11/ruffle-nightly-2025_11_11-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-11/ruffle-nightly-2025_11_11-linux-aarch64.tar.gz")
sha512sums_x86_64=(0dde7fa69373db4f348e099e4072cd8dc8dd1186567053a67440ca20a7e77daf5d7697f6d74da30653f5eda7350ecf6675b53f4afbbc5a7a69baa6b14888bc8f)
sha512sums_aarch64=(337ccccbf8c76b270e852d973f4d9877f874fc7ac55f1c01d61ebc6fb31f7b1e2c295e038375aa5739f31d230bf3407e63a517e52f9543c16879ad3a328c6283)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
