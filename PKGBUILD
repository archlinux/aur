# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.4.8
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-08/ruffle-nightly-2026_04_08-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-08/ruffle-nightly-2026_04_08-linux-aarch64.tar.gz")
sha512sums_x86_64=(dea003fab741553a7dfd3387c7ae3aeff22934f76f0879095786b5ade0ac34ab5716c1440574666816748a0b299417b6e4208c226e06b02634d7227bea3933f2)
sha512sums_aarch64=(dc36fcf4b02684fb53d41b1a0eccfb1c5d44d5cf6204bce61e239a5c21d405bf7c8f7c1e178c7a6037cc262ad610b29f49c06cd4cf6f56b00d13d17311246f59)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
