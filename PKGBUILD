# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.12.9
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-09/ruffle-nightly-2025_12_09-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-09/ruffle-nightly-2025_12_09-linux-aarch64.tar.gz")
sha512sums_x86_64=(3af9f831d67cf26cc6320e4b8ad5eefbbbdae952a86d3e7e368936d0b1f41ef0e2a6f48aa88c273f9d8748156fa1364ad993f97a287fb79f8a9b147bb839f037)
sha512sums_aarch64=(73bc2df64778f48b6e9776c0b2eb6a057788baa9995e5be788dbfac8fd1f9bf2f0de17655c116afa14641a0e07faa4a5f02a92c577686085ef0885b998bcb436)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
