# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.12.5
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-05/ruffle-nightly-2025_12_05-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-05/ruffle-nightly-2025_12_05-linux-aarch64.tar.gz")
sha512sums_x86_64=(c402caf13a4844c071d6ee624f5d422d50b6f556757170241b164edd9f4ed2a2a1cf003dac609e75995937d3fb6849a5e97b5c66f4897c55267a4b942f7bbcfb)
sha512sums_aarch64=(cc3540d943551ae48dd4b15a56a31026d6bddeb5ca1c7e802bdb6b3877d1e6d38e4b5b027b5b7e15ea34ff582d48f339bcfc61a899efe64b8707ebaa49c57fd9)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
