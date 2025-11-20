# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.11.20
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-20/ruffle-nightly-2025_11_20-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-20/ruffle-nightly-2025_11_20-linux-aarch64.tar.gz")
sha512sums_x86_64=(3a52cc454b68572700e48c8d3af9f9b55f3d00b78498f29c5c235ce53559337ae321c3363c90329a24921377ff08f959211fba0790aae0763be4d01e3bd02d2d)
sha512sums_aarch64=(31afb2e58fba9fa53b5c6dfbe4d5f745db9a857170384155ed1ba07e0209d7fe0592a44d3b42be919d2e02b4dbf156ef43e5c7808f04c724af581415107c3412)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
