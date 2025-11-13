# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.11.13
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-13/ruffle-nightly-2025_11_13-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-13/ruffle-nightly-2025_11_13-linux-aarch64.tar.gz")
sha512sums_x86_64=(0f6ddbc7bf40bfe5c85e2b44004172ed8d0dd2864028e6f6181c15d6bb1ae219bd563300307830ef9d7f0b601479d53280eb25ce86823fcbe169520b2826faf5)
sha512sums_aarch64=(819accb3d525e60e105c1853dc6f79ee2465eaac91392d1049cfa27d8e6934356b539436cd0accb7ba637c13f9c76421384ac41c696da5d1bbde84c2ad73ff56)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
