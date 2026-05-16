# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.5.16
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-05-16/ruffle-nightly-2026_05_16-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-05-16/ruffle-nightly-2026_05_16-linux-aarch64.tar.gz")
sha512sums_x86_64=(41479466f28c822f3c81da57d5b4928dc9b5488463a966268a3600de814399068e660e670e861671f7df54eeaf38588a2401ada50ce6acfe03d6f5cde506dc9c)
sha512sums_aarch64=(5fd4095d102b8f8b963e48f9caefbca4db7027ba34334e8aaf7a72a99e243fb0b1b7b39ca35a5c4e58ae4e099c273f9552297ef2bf28cf6fce5fc43b7a0b0535)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
