# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.11.8
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-08/ruffle-nightly-2025_11_08-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-08/ruffle-nightly-2025_11_08-linux-aarch64.tar.gz")
sha512sums_x86_64=(64f4018b3eed21dc08736a5ecf60dda4fcacd15d2eedd08518542432b56bd9458ebe495a599fe6c4c52440920ee55bdd12710d986d3f9cb95370d0f20da9d43d)
sha512sums_aarch64=(7150bd4bf37447b6b60db646dbf491901b300d1ccacb4e7ef24406b85f9e67517db52889cb008a992fb5ef743e1c0fad7aefa1018f44cf7ab7276918ab00de7f)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
