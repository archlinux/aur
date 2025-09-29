# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.9.29
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-29/ruffle-nightly-2025_09_29-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-29/ruffle-nightly-2025_09_29-linux-aarch64.tar.gz")
sha512sums_x86_64=(f0e3390b17c4c01c35e921d3dd494e4842b8f26c378257ac5580e03de28a2195d0923b013c10e6ec4b5d55cb80c43c27121afedbcadd72c27d329e139707f9e3)
sha512sums_aarch64=(19daab41a0d6f9dae0f6e6b20f97442d5c61ac11789c7e66b085ede0ea9afae5f3187125a453a39b226fd36f07ed6eb0aaeb7fb10717412f290b2eb67e0166eb)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
