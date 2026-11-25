# Maintainer: Kamil Jarosz <kjarosh256@gmail.com>
# Maintainer: Ruffle LLC <ruffle@ruffle.rs>
# Contributor: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.11.25
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-11-25/ruffle-nightly-2026_11_25-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-11-25/ruffle-nightly-2026_11_25-linux-aarch64.tar.gz")
sha512sums_x86_64=(3df0a343099e0ae31f4cd2e1d023a03ef8e81c089f3fc5fe1c295587329ebd5638ba51f1f4ec0578c45840d4c257e63de101cc98bd8c9b5224fb12d17da40224)
sha512sums_aarch64=(d3eef493221c6333e1ba2193c84136d5037652f762044b202a3e88a9e2cbd97136ec058251ce80c8fb83d5a6241c826a4f14ebc409b81086410ec36a74dc058e)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
