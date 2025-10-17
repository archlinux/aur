# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.10.17
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-17/ruffle-nightly-2025_10_17-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-17/ruffle-nightly-2025_10_17-linux-aarch64.tar.gz")
sha512sums_x86_64=(715bea1a8b7badff47ccf498d80ec3b1ce6eed54ec41f55aa6f6fa7a6de217d372e38449e8902a8e6eb93fa97299d6a1c5d95fc84c19c92bc8f381b30517d9b9)
sha512sums_aarch64=(8796e64b08f323c4deb9e22353bc4dee9d9a0ceef18b69728ae6a7739816ebdd7fa67b70a5478b33561f489c4b5d00dff79c55e1dc6e3abd2a49d1d776603bd5)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
