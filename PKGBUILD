# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-bin
pkgver=nightly.2020.10.29
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
conflicts=(ruffle-git)
source=("https://github.com/ruffle-rs/ruffle/releases/download/${pkgver//./-}/ruffle_${pkgver//./_}_linux.tar.gz")
sha512sums=('37a4f49cc232e04fd559635ac30cbc35ac05d16e326d031110ff3932389876db4782e2517ff6bfb65a135732b20fccd59f3a5516510f40633674c25c7ef23fec')

package() {
	install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/ruffle"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" "$srcdir/README.md"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/LICENSE_"*
}
