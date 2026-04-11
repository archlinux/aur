# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.4.11
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-11/ruffle-nightly-2026_04_11-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-11/ruffle-nightly-2026_04_11-linux-aarch64.tar.gz")
sha512sums_x86_64=(ca8f61fdcd923a9b6f5fb6e40fb4492a81b0083dff16fdedaad05ccc0c631adbd4b2c31e3432654e1e420b49985b50fd4b0f5bc5d6a609c0b12688283b0bd4cf)
sha512sums_aarch64=(e98ad4e987d19c8d5ceca79865b1dddf77f7b7ad6a60a95c6c2d0ad391314f3520f59cba54b46fe163b11d54075cb52a618ce6fac5811846f27590955650da91)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
