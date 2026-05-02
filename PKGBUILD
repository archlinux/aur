# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.5.2
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-05-02/ruffle-nightly-2026_05_02-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-05-02/ruffle-nightly-2026_05_02-linux-aarch64.tar.gz")
sha512sums_x86_64=(57c3c72c12a72a3a7695c600d129b8cac8ed08131f958dbc7956018b534d7c1832f4798db51a4d72fe115f14cfe3e567f360a774e0e0ff83d729d35ca4053511)
sha512sums_aarch64=(b4b5d95e21a102e60d4807fab69e0288bb66ec74fbfa6efa6a3f886400f2480a488bca0acfcc75a1c7d17824b105cdb100dc373bfd22f22139a4a3f702e21904)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
