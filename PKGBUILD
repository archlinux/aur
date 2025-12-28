# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.12.28
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-28/ruffle-nightly-2025_12_28-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-28/ruffle-nightly-2025_12_28-linux-aarch64.tar.gz")
sha512sums_x86_64=(df6f60875b83c31567aeb6136146be7cb56779dc183ebe460e98692f4478266ead5ebe7f31689d73e98220c1e7c3bc3f2d267d3860c2263e32622d2284e38abd)
sha512sums_aarch64=(6b3d92693ea8148affc78e7e0b94f727aaa6d8c9d4e41488d73d23e0ebc073556e7f54ca1e73486b2d0ea69b70eaf7ed6126dd92a6396982c17be4e37e3c6d53)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
