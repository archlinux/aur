# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2024.02.04
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(openssl zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle-git)
source=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-${pkgver//./-}/ruffle-nightly-${pkgver//./_}-linux-x86_64.tar.gz")
sha512sums=(c97997a31de7d8b9c1fbf8e12d97035db34c6c93b0fca96680a4c9234bb712bc71ba5f9d41ff1a87574a3d3548d2613618c1078f1c329a4f30b604a3345a09b2)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}
