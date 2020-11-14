# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-bin
pkgver=nightly.2020.11.13
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
conflicts=(ruffle-git)
source=("https://github.com/ruffle-rs/ruffle/releases/download/${pkgver//./-}/ruffle_${pkgver//./_}_linux.tar.gz")
sha512sums=('badca40841b93ffdc74cf891f9bb7acc1c422c0f8be7e1dea2d7ae44cef265d4b56853dca772761387498ee4317bb88ff60ce2199a73eb0148690812f86ff8fb')

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE_*
}
