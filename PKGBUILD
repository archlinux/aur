# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.1.31
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-31/ruffle-nightly-2026_01_31-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-31/ruffle-nightly-2026_01_31-linux-aarch64.tar.gz")
sha512sums_x86_64=(0f7866036c59a451b3cc7869ea59b33fd92ad9d40aa13b434d552afe4e368a90b8d54f3dacf324f6d89661a708b55baf27954550ca03ab1c7f7e1f3515a3bb6b)
sha512sums_aarch64=(2eed7a733ea4d3e28fb4687d174cbe3cbffb3558b581af4c1cc0550ed875dcb971b0ef65c429fdcf46a019c837b6ee599feb0f9b557515af8f521053c8d19728)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
