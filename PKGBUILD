# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2024.04.27
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle-git)
source=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-${pkgver//./-}/ruffle-nightly-${pkgver//./_}-linux-x86_64.tar.gz")
sha512sums=(79682028a0b2263c217c96c6d9c3221e70d37d7cbd7a63b18e3da8c72f8036cb745054eb2e9f9cd9379e9cb2fb7929846c917c942837fe12173d4f6e13d1698c)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}
