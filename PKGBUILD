# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.2.18
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-02-18/ruffle-nightly-2026_02_18-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-02-18/ruffle-nightly-2026_02_18-linux-aarch64.tar.gz")
sha512sums_x86_64=(890b22638ad08f5c79cbff696b6ac28cc00ec5610ace779d69c047c7a558a200b6b0c3cde85b81abfec112450d1cd8b647761f311b669e0f55a82fa41243457d)
sha512sums_aarch64=(7cc34dc03b1fb9356e46c7dbb052e3b609ee4b1a82d5dd442f14d69ff8056a6ec35923b1abc77285015b76817eb8f9138a902d3464e08a07aca402febb5fc87e)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
