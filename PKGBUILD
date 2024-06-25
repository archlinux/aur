# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2024.06.25
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle-git)
source=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-${pkgver//./-}/ruffle-nightly-${pkgver//./_}-linux-x86_64.tar.gz")
sha512sums=(2001a387a4011c2ce1dd5eeff17685fbe325e6dc75a0ee9a9febe3e1fddb9f4b6e44fb1cc5c4f324c546ecaeaa1018a67b327db239ed2e94f9be9eef3f8ca3e5)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}
