# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.11.29
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-29/ruffle-nightly-2025_11_29-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-29/ruffle-nightly-2025_11_29-linux-aarch64.tar.gz")
sha512sums_x86_64=(49ceb7ba372cbae1b0c85be38bbbcd13515b138ad4a5a42d88d489bb1b485cc1d1a4477a7b43c5a1c4cb1e7ce352b5dba5605bee7c0706ceb72892780137b3db)
sha512sums_aarch64=(ea314afb2067ede705650b19bf6be458571bde44b170f97d6dbc79aa36e04aeeb795cea989c571ee79edb0d40c1c7d1dfa5dd67a396600222a00b7e3067e6e18)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
