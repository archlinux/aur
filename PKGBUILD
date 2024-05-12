# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2024.05.12
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle-git)
source=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-${pkgver//./-}/ruffle-nightly-${pkgver//./_}-linux-x86_64.tar.gz")
sha512sums=(06cc2dac2aa97803d63306a5dcad4ad205a364314671e8f3a690c66cadad75414a3463c24c942267e5e064958ff959fbc9ed5eed688e4961864ace0f07ca2b1b)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}
