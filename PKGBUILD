# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.2.25
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-02-25/ruffle-nightly-2026_02_25-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-02-25/ruffle-nightly-2026_02_25-linux-aarch64.tar.gz")
sha512sums_x86_64=(0815158d797d78da8c9d13b093c12f68f65bc7e56a9a33ec54d6121c3b40981a90483ec5f58cb1daf6a691dc1358dddbc73fe33dc6096895769c1bf702598d93)
sha512sums_aarch64=(4cfd81d13ace2a6ee5116b83a09ad10fd2d66491ad593bd801db438ad83afadce25f146ee78d8cec2552b7b7416455e9e8b3044b4007e6cdb1476818a14bcd19)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
