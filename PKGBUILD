# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.4.19
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-19/ruffle-nightly-2026_04_19-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-19/ruffle-nightly-2026_04_19-linux-aarch64.tar.gz")
sha512sums_x86_64=(6b1d3f9f7bd744e5cb539ac6465619974c4140f4c0af2545bd4ab401bbfe2142857887ad5d3e153dc1eadad642562265d44fcb5b8f808ea9502fabf6593877f1)
sha512sums_aarch64=(d5de7a2e458ce2b7e96bbbb27075004934be67312aa0cd1fc944cfdd09fccdafa90b1e8377d2601c1ab1be9e2398229d0a2f352fee3512ef827fa6730d4adf4f)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
