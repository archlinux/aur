# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.12.2
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-02/ruffle-nightly-2025_12_02-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-02/ruffle-nightly-2025_12_02-linux-aarch64.tar.gz")
sha512sums_x86_64=(27ee802ecbd3747f0b3c12032e94941d80387347e0e31763faeafb0104787ec3268493c74b15d7370230862b63157d9226d43aa42ef8fc4662ba52544a331333)
sha512sums_aarch64=(2430920df3b4c700584bce83ad1097e67d10a1c9fe7a8a36b10cbf54a444a039239e87dd54c947ad4cad7b762d0058f1a7f3c771826bbb70f8fcc7a1c40b9654)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
