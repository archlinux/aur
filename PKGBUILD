# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.11.30
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-30/ruffle-nightly-2025_11_30-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-30/ruffle-nightly-2025_11_30-linux-aarch64.tar.gz")
sha512sums_x86_64=(e876714d9dae41d6ded1b01015ac458178416461a5c30e7e896179793f3e79dc9fe5bca995caa2cf5ffa434a995dd8f347c06501b320d4a4026dd5c8f857ebb2)
sha512sums_aarch64=(270254e3f45e5823be7abcac698940ec0b2516d8127105f6dd467aeda89b40930db5874837adbb8eab5c283daf083a12d2a79e250e792c136ec3655527d6b7f0)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
