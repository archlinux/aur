# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.9.9
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-09/ruffle-nightly-2025_09_09-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-09/ruffle-nightly-2025_09_09-linux-aarch64.tar.gz")
sha512sums_x86_64=(ffee0a4b358026f69a1ae1af275b982d473a5fb2b3d35b098e06a91137ca1ee0ace009e1c07698fc6b0cd7b92500a444443267dbc37171b8079e94ab8de9354b)
sha512sums_aarch64=(cae5456b4bd46b8f5fa6d7c6081608b114b1043920535611a5f752441006b6c27f1ae9b415ea16f7a1c473376955c1b11c1411ff7d3dcd274fd4e31e70175936)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
