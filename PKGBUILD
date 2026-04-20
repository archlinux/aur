# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.4.20
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-20/ruffle-nightly-2026_04_20-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-20/ruffle-nightly-2026_04_20-linux-aarch64.tar.gz")
sha512sums_x86_64=(f94fdcc5ff8ff54c27ff15c9107ebfa27c08cb6bd233de91a0c24d212db77106e5771cf92efe1223f6952364323f02addc9ddd3e2e7897b9afcb95d61f33964a)
sha512sums_aarch64=(8f34c89ca0666a438e0d0c073e7041ed5cac1d595b80d9c56bd38c75dbb92af5dd8417144362d5fb8d1e85877012908fa37e79986ec1ee9e17838f0b3b4dfa9b)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
