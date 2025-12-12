# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.12.12
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-12/ruffle-nightly-2025_12_12-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-12/ruffle-nightly-2025_12_12-linux-aarch64.tar.gz")
sha512sums_x86_64=(2a3c38562fbb30c097b1c143a33f7ed5249a0b18afde6ec4efb8330c227c24023bb75aa46d845b50487a0e0eef4733b5b94ded5c5ad8f0af09bac9c7db47933b)
sha512sums_aarch64=(ff587c82981354cf1d107ff7d8d161d5f6aaf3bbced9a496d7da9f351829808b8997fd7fb1d3d96e0249b7658d20ad5decf6890f1d0b0a1940074417ebcd4781)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
