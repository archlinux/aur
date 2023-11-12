# Maintainer : Daniel Chesters <archlinux@coin-coin.xyz>
# Contributor : Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=kalker
pkgver=2.0.4
pkgrel=1
pkgdesc="A calculator program that supports user-defined variables, functions, derivation, and integration."
url="https://github.com/PaddiM8/kalker"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64' 'aarch64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/PaddiM8/$pkgname/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
b2sums=('07faa060344afc5b8d34655062e037f1f5c43aa07efd5e5088f7b3a644e49445ee09f341e91f27b97ebfb86ad28d5c5abdf2f9192907dccf2b79c2443d9abd8c')
