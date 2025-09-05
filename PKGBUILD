# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.9.5
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-05/ruffle-nightly-2025_09_05-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-05/ruffle-nightly-2025_09_05-linux-aarch64.tar.gz")
sha512sums_x86_64=(d1db4a3105030af5ee81e668ac9bf03d2c4fd0e35628a0962f7ddaecc12f442e489e846c44bb40e9164175fa1a972a0927b09a25b276947695077650776b3e69)
sha512sums_aarch64=(85e55d280aca5bd47b0639beb5ea441d435fd874c61bb7f48ad1659cd96518cfc54cd94542abbcd6cc56aec3d6b02d4c24a09b1f3fc461ab61e0bfb3eb3ff350)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
