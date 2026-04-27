# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.4.27
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-27/ruffle-nightly-2026_04_27-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-27/ruffle-nightly-2026_04_27-linux-aarch64.tar.gz")
sha512sums_x86_64=(f92c5fe80854d8449c96115fbe0e4468df5698b6f193eb1aab19b9b58392c6a8471b18f62c8c20fe560840ea4e666c55ac632a97dde7372bb9422c7d65acb6eb)
sha512sums_aarch64=(385d0a2e3883de5eda42f629eac9c3671941f1e8435e3bb425ee4c59c10cc730c31faa50c981f0a3d5fa256395e46f63b282ab7cbf9fff64ecd5a95e3d15565e)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
