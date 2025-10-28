# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.10.28
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-28/ruffle-nightly-2025_10_28-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-28/ruffle-nightly-2025_10_28-linux-aarch64.tar.gz")
sha512sums_x86_64=(bac2da2ea62391b7fc11255044fb58ef23d0205aab96bc2af62f098f298ad9dd15a4196e93e40d7860838b7e50a359f2bf7514ddf7278a60b3e4b7623a2c2a1c)
sha512sums_aarch64=(24a29a639b18606aa4b83b8118c0e270a60111c66de237555d3c75deea3b029d4c4add55408ae4d64a2efdaf2faf94b4e7c34add2103312dbb6303bdbec697b3)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
