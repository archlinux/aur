# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-bin
pkgver=nightly.2020.11.22
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
conflicts=(ruffle-git)
source=("https://github.com/ruffle-rs/ruffle/releases/download/${pkgver//./-}/ruffle_${pkgver//./_}_linux.tar.gz")
sha512sums=('15fddf24b917a95242bc21e603702a2389bb38fac23306b6d6c6e9a37ea7904e6890b2c6956d586d130b61b051dee4546e4a934b69f911fc98c4e350a84b3316')

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE_*
}
