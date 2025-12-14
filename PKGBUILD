# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.12.14
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-14/ruffle-nightly-2025_12_14-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-14/ruffle-nightly-2025_12_14-linux-aarch64.tar.gz")
sha512sums_x86_64=(f9e9de5d1c0fbab6cf703464887cb7daa3e2352b83a6da8324d7ca0097c5ea6f85ff49b14e3cb8930b5d0d5442667d5393deeec47a0efc8607eface046a6ab23)
sha512sums_aarch64=(90e4cfa74d97fac7b53dd3ca6ca725b25e5eeaa6a5007d2910d18d2cd0db25555cc1024cd52520f01b5396fed92c53eb37e4e1e3b7cf52f2154e157c30e8447c)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
