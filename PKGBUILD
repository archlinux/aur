# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.11.16
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-16/ruffle-nightly-2025_11_16-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-16/ruffle-nightly-2025_11_16-linux-aarch64.tar.gz")
sha512sums_x86_64=(8a9b22ede38704d0510047071e060cc2f7db91f89060b67f796becaba1bff66aec7236fb1251f4a5f7668195ec7617f16770d61748688024ac8289fd5dd961cf)
sha512sums_aarch64=(67dcaeb26ecaed38cf8f07f9a8e4d3ac75da9c7c6ec1491e957d25841f9c6010660e93f5eda49a7e8cdad7e808081405302086dbfd5ef11ceb1fe7fd95fca8af)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
