# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.11.5
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-05/ruffle-nightly-2025_11_05-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-05/ruffle-nightly-2025_11_05-linux-aarch64.tar.gz")
sha512sums_x86_64=(0b668271689d8633da78fea28eb9d286df7610c0ec5f0566add0dcaaf22290836ba77fbd777b801fe09c942f770c52ca6ab2df048d865dbcb9b4a25a1e615ee6)
sha512sums_aarch64=(19428fa559e9f4591ecaa1ddfc875dfd5e123189abc9d076ef847e30809de525d8e2d2ab9001fda1fe1889e31d5a5182b056ee303327245e1d3a48f5e31f6f88)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
