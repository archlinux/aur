# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.1.17
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-17/ruffle-nightly-2026_01_17-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-17/ruffle-nightly-2026_01_17-linux-aarch64.tar.gz")
sha512sums_x86_64=(835a9fee3858e0d62b1cac5aa055f3082f8d6ac881426006fadced3ffffee3da0975864bfc674b2e6ed9b113ffb8d9a9e2b0561daff7472d7ccceb800f56eef1)
sha512sums_aarch64=(d14de9b2459eaf0d59ca42c5581ac12acf1ba6438a281295b1c31f39bcb483057d8c3796ff3619b553dac84fa68bd5d4dd0890673bd4914aa4091602bfd183eb)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
