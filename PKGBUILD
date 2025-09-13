# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.9.13
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-13/ruffle-nightly-2025_09_13-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-13/ruffle-nightly-2025_09_13-linux-aarch64.tar.gz")
sha512sums_x86_64=(7f2f3a5cff5795a71bfac9af391d3cb2dfb1ef2b80bafb74b794fa5617e17369a4cd7b55c7905257c301de8a5a794aaaa7079751df1f9c832b33978c9fd81c94)
sha512sums_aarch64=(be00e2a2eb324269d2acf4c2bc9862101f36ce809afe27c911499180e5336ecebf48194509a92fb6ab8599244824ea7e16b06f7882a6e670c8e36e4dd74b929f)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
