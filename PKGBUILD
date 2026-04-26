# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.4.26
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-26/ruffle-nightly-2026_04_26-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-26/ruffle-nightly-2026_04_26-linux-aarch64.tar.gz")
sha512sums_x86_64=(4db59ab401c55cfe8368f3e734377a6072644863f694495868e0e4f2ba4fecb945ca08d40e205e84f1e8ecfb5b3330f6563805297e0c21bb038ca6b591bd4e04)
sha512sums_aarch64=(efc8846ce413a3ead60d9a0e03b2570d874ba4a511a58c7b70908dde443148780683ddb180ce0414278f07c6a69f0b4b8cb3dcc7dfadee26154c5e8a852e6cea)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
