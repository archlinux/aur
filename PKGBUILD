# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.12.11
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-11/ruffle-nightly-2025_12_11-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-11/ruffle-nightly-2025_12_11-linux-aarch64.tar.gz")
sha512sums_x86_64=(6d6a86cccec4cffc0ca36aa17cff5bf9a88cb9a0c88ac3ec81df77a1eb6d7eda563b67090946c218258969f6b67ec61f0809c6365e559788b4f8145a7364e063)
sha512sums_aarch64=(d1eb267c3a1f7b4f6e3d2d3aafec04f9b27ae8a6457cbf6e88e64cacd28b3a1277871a8118401b34845ab846b8ba97fb8c2f3539723b47f92e6509f2527fb558)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
