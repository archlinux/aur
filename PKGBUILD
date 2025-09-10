# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.9.10
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-10/ruffle-nightly-2025_09_10-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-10/ruffle-nightly-2025_09_10-linux-aarch64.tar.gz")
sha512sums_x86_64=(218757c4bee2c91eae6d07699bab6d8c1ca96cfd8adf2b3878944fb4ab1303b966133ba7fe21cd796659585a2b9609d79e8e7cefaeaacff760a001fef22ee97c)
sha512sums_aarch64=(ac0010c1a0878cafee6c264fcd2259ac7301044b8be8dd1602c47794d29a5c45c0817bb6660ee8a44872c3fea1f52a77ec92c5da2119850a90688e7b88b231da)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
