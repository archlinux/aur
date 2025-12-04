# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.12.4
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-04/ruffle-nightly-2025_12_04-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-04/ruffle-nightly-2025_12_04-linux-aarch64.tar.gz")
sha512sums_x86_64=(2fe587f2725b1081cdcd734db4ae7558888054b7d05ee7286534cc86bd61921a877594b14436a26dd0cee96f03e7ac19237b71b13eb2d74214e614f21389fe5c)
sha512sums_aarch64=(0dce4cf7d7086535ff56779bd0cc3d324624c66ebb48dd37e17754752c2b0a485416b98b9336092e6905d2cdc6e81847eb77e7ba435da01ba535e2ee716a8649)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
