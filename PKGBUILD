# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.1.29
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-29/ruffle-nightly-2026_01_29-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-29/ruffle-nightly-2026_01_29-linux-aarch64.tar.gz")
sha512sums_x86_64=(967ea9327ba4642fb13c35a32ff9769064d6448a079b00496dcff07c08e6f9895f811ab705517e3a92df7a26d6fb735d94800b3e8a0ef7cc7a0d65928145d08a)
sha512sums_aarch64=(1014547abbdbc913f41b87657d1bd8f8cb516ced4c67048944fc8f81f9b17bcc21ad8b9fc9e2864baf350160a52e9517ff2c5fb4bcce6dfa92a7139a355d84a6)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
