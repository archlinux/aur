# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-bin
pkgver=nightly.2020.11.20
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
conflicts=(ruffle-git)
source=("https://github.com/ruffle-rs/ruffle/releases/download/${pkgver//./-}/ruffle_${pkgver//./_}_linux.tar.gz")
sha512sums=('1d402f03ba8f256f15be951f850388a0ed79556fcddc64cdd2fed208c80785e5e9684c5e018553517ba3ab924047d4ed8f25bcbfaab99becd139b53783e356b4')

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE_*
}
