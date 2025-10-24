# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.10.24
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-24/ruffle-nightly-2025_10_24-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-24/ruffle-nightly-2025_10_24-linux-aarch64.tar.gz")
sha512sums_x86_64=(d4372bb2abc05f132cf90efc3aeaa1fc4b15d80d892402ef8a9bab8bc3fd65345c0f30b597dcdfbf7a53ba91c97162e1eb24eb09ceac3e0dbb95577eda33e5c9)
sha512sums_aarch64=(1d6530be13ef2c9ba8e0be6af700694a5c79544ac4a69a3cf322e89c92a344a3dac10d0422c07461b694e28d8e89fbb6777d94521dbd8a9f6a6d844b79b9561b)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
