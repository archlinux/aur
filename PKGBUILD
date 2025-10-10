# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.10.10
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-10/ruffle-nightly-2025_10_10-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-10/ruffle-nightly-2025_10_10-linux-aarch64.tar.gz")
sha512sums_x86_64=(90bd5129631c23b9c6c4ec53ca16278e92bc33046ca97abbcc57753e3f1a9a91bf6291495a05f7a6a9054b040640453d458aa54b9c5189c50d37cd78d71be226)
sha512sums_aarch64=(3ed1aa3fd0f93606a4eb320751382a147a4b5ddd2c6191fec8cb9efba7acdfab334cbdff5254f1ea05e977e6d1a97e7c2fa2303565f0bb9d70cab501c8531dca)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
