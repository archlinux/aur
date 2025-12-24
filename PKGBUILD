# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.12.24
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-24/ruffle-nightly-2025_12_24-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-24/ruffle-nightly-2025_12_24-linux-aarch64.tar.gz")
sha512sums_x86_64=(ebf77ad3e11404b9f491ff32115caeaa6c669b57eab1063f574649af93fb8c7f93a846f7a37b033f9c5218d3d2fd7f674a930e0c81a95708785952b3b31a617c)
sha512sums_aarch64=(0c189530f8d47aa8522a30b321e3064aa22ad83e222d3e26c8fcd831eccf40b2d7f7f230984bc503c5fd4ed31d1ed3b73d0602942fabcb2b8869b7a4595fb95d)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
