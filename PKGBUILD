# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.11.3
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-03/ruffle-nightly-2025_11_03-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-03/ruffle-nightly-2025_11_03-linux-aarch64.tar.gz")
sha512sums_x86_64=(62eab34b6ecb5572760b41eb2ceccb32a8d616973860847ee60fef40d93dd416463bf30c59f27fe9b0e5ae0b416b31f5a15a1ece0b40be8c15698a8bfb74c03d)
sha512sums_aarch64=(470ec56e95bc836f3fc79716d71920d212301a98ef5d8f54dbde85cc9177815475a3f9eb6d385ef98223446352b933f372ffdb2d859dcf0cde321db2b9a67018)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
