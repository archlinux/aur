# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.10.21
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-21/ruffle-nightly-2025_10_21-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-21/ruffle-nightly-2025_10_21-linux-aarch64.tar.gz")
sha512sums_x86_64=(1dc9a2897070205e6446170e43f9b646cb21757427b41a14de9fc5be5be9a93e3d093eccbaf7e74b8ffe093e9f01d0777acb0b7e6c4dce95e092bb79db57be23)
sha512sums_aarch64=(3719bd346694ef18f9fbb3772380945b6ebb364a183778288b86083d3d121439278a57cfd014f95e5ed18d42d0bc149ef3a90e4e22dbbb6f1360a54a2f2d8363)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
