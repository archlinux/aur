# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.10.25
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-25/ruffle-nightly-2025_10_25-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-25/ruffle-nightly-2025_10_25-linux-aarch64.tar.gz")
sha512sums_x86_64=(5eb442b05839f864fc3809fed2f902b1523fb1fd4eda1310e7e85e08b6c65cbc79d7b4876a86b5dbf07f8d070d63209b91c2ff36c5faba1be9ec903cb569b1f5)
sha512sums_aarch64=(4a3e0b75f25cd58c8b9366a1f99aa0d650cedc3f661e3f4ddace0ecff375ddf921bf90fa60d662f179bff841164d35034bfa8a3fd5b474595f735f717fd5c2d9)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
