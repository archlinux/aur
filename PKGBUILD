# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.9.8
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-08/ruffle-nightly-2025_09_08-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-08/ruffle-nightly-2025_09_08-linux-aarch64.tar.gz")
sha512sums_x86_64=(7d1ec1a971bf527c3d94c483992a2ddfa1e43df81824af355a0a69fcd4b9fbc9d12331bdcc963fc876a3e1262aedc63c6d97f1a4fd8fe92f4aea59ce2cb63f44)
sha512sums_aarch64=(0c474f4612b4f76a8f4593789851d99e96005a316ea005fa4c0f550cca098475f23e04b277338bbc8adedbc495b7bd300be08cfdcc0ba2896b0aeb7feab5a97a)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}
