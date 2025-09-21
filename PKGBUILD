# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.9.21
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-21/ruffle-nightly-2025_09_21-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-21/ruffle-nightly-2025_09_21-linux-aarch64.tar.gz")
sha512sums_x86_64=(90330ed28b708db3861439da536548e00c8ee68c132c6b798244a26203d09e6b7958cdb774c9a0f82d20419345c36f57e72381d62e8889c4f36817db66a0c525)
sha512sums_aarch64=(344b7bf5ddb3f0ec6325b83786735c4e35bd4097a7f00a86b92af861ba6aa28b3c4f3fc50f9992928afe53f367deeb518d9b87ebe516fa1327913aeb5c5fbb99)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
