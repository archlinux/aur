# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.4.1
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-01/ruffle-nightly-2026_04_01-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-01/ruffle-nightly-2026_04_01-linux-aarch64.tar.gz")
sha512sums_x86_64=(a9eae8eb9310a7e946d015a39392a2683a583a3ebdcb253443da9f9ba4c13b8692dc8f96f4593c23f9c8f6a7862d3ab270b8f32666ae65ec5402fb378480b61d)
sha512sums_aarch64=(655779232f47d3de3f2a32a963d81bc86d92241e17d6186dcd284ebb1f401b2c024ea4da58a44767c16bfe91d78b97c0d3fcae8c3cbb991e0098276bbc81c0ee)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
