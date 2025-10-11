# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.10.11
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-11/ruffle-nightly-2025_10_11-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-11/ruffle-nightly-2025_10_11-linux-aarch64.tar.gz")
sha512sums_x86_64=(50110fe1ef4fa454bd730ba5443d30dd9847d11297c685b27b1494a77d26a2bef701e00fd82a4a29a487c4b6ae7361df406ee5033fc5f217cab3eb805a85fb33)
sha512sums_aarch64=(ff1a135ecb1874141ecb1ce24d545722dc18c350e149ef399c0605cf6a6b52be44d2dff6942ec6068184696d84153804ad975bfc7c41141a4eae689c9ec0d99f)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
