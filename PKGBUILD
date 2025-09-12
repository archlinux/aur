# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.9.12
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-12/ruffle-nightly-2025_09_12-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-12/ruffle-nightly-2025_09_12-linux-aarch64.tar.gz")
sha512sums_x86_64=(7c7d34ff638d73a594a2411c28bde6e3397d147e58a35c4595577693b6d53f8cf53a1033cbb03be0a186f76bdf5aad865170cd795bc9f20b227c9e07849a3c29)
sha512sums_aarch64=(3ff990513b28f6b6cc1b9990f787ab7b7a3dfef8f089f1ed74d2af77ad4ca448082ca6326e9f8eb79268155544c3282e87f3ebdafb392a72c5822577fdef1caa)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
