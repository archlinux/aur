# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.12.26
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-26/ruffle-nightly-2025_12_26-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-26/ruffle-nightly-2025_12_26-linux-aarch64.tar.gz")
sha512sums_x86_64=(c82ad72b3d65a51b74fde9c8eaf4711d1241b776787e770f2eb14d1437bbeda447b81aa6b784a738f0cdcd94a9924c907a9cac1c5921be6312694467de36f2a8)
sha512sums_aarch64=(24cd3a161f6cec7466af94d7e87e9e22172fb41c5f02886619b3b38e3a16f8e6dc460cfc4aa88287dc8d1ec25f2d3665ec7d366ddb52b929c75e44325da17a00)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
