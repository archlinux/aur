# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.10.14
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-14/ruffle-nightly-2025_10_14-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-14/ruffle-nightly-2025_10_14-linux-aarch64.tar.gz")
sha512sums_x86_64=(6845c292b024d4151081764a3095c276fdbfd1252ac3c878d45a5564fe1c4c3a52a31b686fd99a4001005fbcbb24b7ffcd4116ccdfca9cf3c424335df11f4849)
sha512sums_aarch64=(8750339a44107f16e50c6a4a973018c2f9c6e2b8fa8f9ce7079a114912c89c8f1a8ae14a8de212fd8c71018c1bb1afbc6a04412701685830fd0d9b30820af29b)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
