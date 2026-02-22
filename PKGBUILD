# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.2.22
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-02-22/ruffle-nightly-2026_02_22-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-02-22/ruffle-nightly-2026_02_22-linux-aarch64.tar.gz")
sha512sums_x86_64=(8a31d186eabdb6f268db58a42539bff50a0e8e7408462895566183ceb0615cdf09ed7a25513632594aec8d72b2a8662c22ec94d209d8efc0dd70ecfb28aa35b6)
sha512sums_aarch64=(99108bc08eed22cfa1aa48725912505d10215774879cd149672edd50eeb3b94e72b57733c5ec655ddb1b988c48a7246977a3e6c6323f5d58e7c0b14c8ee46014)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
