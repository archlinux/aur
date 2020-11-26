# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2020.11.25
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
conflicts=(ruffle-git)
source=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-${pkgver//./-}/ruffle_nightly_${pkgver//./_}_linux.tar.gz")
sha512sums=('31d838d8f22b689c857287c01f40ad70cc1c93c1cabeb438e2f5cb0d00b8216ddb9ec882f6cd9b81fde118feafb9214b2d1aab1fdc38d548d5f4279d97de79fc')

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE_*
}
