# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2023.08.22
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(openssl zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle-git)
source=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-${pkgver//./-}/ruffle-nightly-${pkgver//./_}-linux-x86_64.tar.gz")
sha512sums=(207a1c674f817cdd0297be8eadd3b93974a0fdf823efc6b42510691edec98e7aae1447e77986c8fb5bbb7911f5f9cc986b8fc66f9862f872133bf392ea547640)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}
