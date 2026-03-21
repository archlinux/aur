# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.3.21
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-03-21/ruffle-nightly-2026_03_21-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-03-21/ruffle-nightly-2026_03_21-linux-aarch64.tar.gz")
sha512sums_x86_64=(63fd5cd628fc6a0e38a94bf1910c704342c36139c6171dc6982be3e2401b7c0a40b6fa745292d44c58ed394bb37a47ccb35072175c7d77bf4bbd59e74e1da88d)
sha512sums_aarch64=(e28fcc215c509d19f73e0a66bc44413c245afb1c18cf28f0227b9d2d657f0c08a076b472c5aefdc1296327cd3333eeddb28f21b1e7dc89b2b449330b0fb3c878)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
