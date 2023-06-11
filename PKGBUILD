# Maintainer : Daniel Chesters <archlinux@coin-coin.xyz>
# Contributor : Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=kalker
pkgver=2.0.3
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
b2sums=('ba741e841fac7ec079183247fafb8f4bbdd5f425a7af323bf00d72310949b076620df5bd27531b96d004741ab9c6533efe05cb43ba7540bb8db19e8ffb1f0755')
