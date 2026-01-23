# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.1.23
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-23/ruffle-nightly-2026_01_23-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-23/ruffle-nightly-2026_01_23-linux-aarch64.tar.gz")
sha512sums_x86_64=(4a94a0920241810064d386e769311eceebe5875d601979198489317ee748e4b6de96cafcd90fc6874c8f9271abc9a6c912e11f7bc58086f90c63fe00a418bf9c)
sha512sums_aarch64=(f6765cde2dfcb11cca12768f53176f8584b905185f1797cbae09d7848a04d8b5d248d00c494eef714651ddd172990a8d627043f55624eb78bf00499c9ae8bd88)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
