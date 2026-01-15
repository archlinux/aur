# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.1.15
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-15/ruffle-nightly-2026_01_15-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-15/ruffle-nightly-2026_01_15-linux-aarch64.tar.gz")
sha512sums_x86_64=(dcf2a82ef32e7556a05314a3bab7d75341be834b587f48887d24a61f27bfadddcff1397a05c06e2aa19f4a14be85a2d3f1cbab391534b97b2ca820bbb67de845)
sha512sums_aarch64=(8a8b927978e3fd36705b229b8a5eebf1591a227a97ba7d63cb4e4b2add73012332cf597d61e3fed4e5302396105f3f9bea0f3a1b6d2514c62376a6772ab9e54b)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
