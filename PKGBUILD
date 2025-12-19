# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.12.19
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-19/ruffle-nightly-2025_12_19-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-19/ruffle-nightly-2025_12_19-linux-aarch64.tar.gz")
sha512sums_x86_64=(77d5d572feb7479f1d3525aed62e8df1467f01cd92018872d233b2bf09d8b9a2c613f604f6552ef32083f5c06c26b7351c65450a6488d7b10c974e9409c5a02b)
sha512sums_aarch64=(53312ea7ca65b6c8726454d5634140ff96a0213e27483a36e49853b7727f69c072fdd8b1a19f457aa90e956677ed4b40205bcb9cc7243897e1675592f1b8b1bf)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
