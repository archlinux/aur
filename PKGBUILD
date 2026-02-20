# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.2.20
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-02-20/ruffle-nightly-2026_02_20-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-02-20/ruffle-nightly-2026_02_20-linux-aarch64.tar.gz")
sha512sums_x86_64=(dc04907eefa49d438c4256f0a3fe2aa1f4c8e0aaecffcb8d62c05d6b74240937847e6fd2e8124dcbd09285a1c3da2ad62b2ae1375aa64329cb17a4aa911cd2d0)
sha512sums_aarch64=(7e3d0f9cf343f2063ccb224e5f8b713abcf29983d9284571c9f39ac68eda81bee3f69ce771bac8cd39b1463bea2302be26187b08bf949957bbefdd0ea06c2ea3)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
