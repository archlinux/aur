# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.3.28
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-03-28/ruffle-nightly-2026_03_28-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-03-28/ruffle-nightly-2026_03_28-linux-aarch64.tar.gz")
sha512sums_x86_64=(076f681a870660dbc39daa799d79558cc7bb211f1a6a4c65a84cf1bf8f7d7e6fc005b6cf7f0750a1dd7c252a7a6a842d8d91b109ebb520af07c83d2bf95237af)
sha512sums_aarch64=(c34c9dc39474471aa4d7d0e3841122f852d74ee7433c6325e5bd736181649d2bcb31504aad28462664f69a5f9a3e07aacf061109c33464f54e46e0e6e3fd7fb9)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
