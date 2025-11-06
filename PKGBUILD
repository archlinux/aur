# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.11.6
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-06/ruffle-nightly-2025_11_06-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-06/ruffle-nightly-2025_11_06-linux-aarch64.tar.gz")
sha512sums_x86_64=(79db8ebb7c2ec892fb5d51997ac62717064f7db2e82f491bd6cfcc41d4328db82ff6d3c699a40453b7626de3c9d51a40a340a8cfcab453fba62dbeb1f2a2724b)
sha512sums_aarch64=(122d1549496e629ede1db7e7b18db5ac583977ef68c5e540c28591a075d9afe15e9ddbd459ba4dbb7e11b1e0a5b237c13aaae2aa56df3fca921d165b49edf809)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
