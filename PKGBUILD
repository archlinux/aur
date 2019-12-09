# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=dust
pkgver=0.4.2
pkgrel=1
pkgdesc="du + rust = dust. Like du but more intuitive"
url="https://github.com/bootandy/dust"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bootandy/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('cb725e509efe429bf47d31af06a8324cb62e620911df252f32cdc42758bbac493efaf981fa2c8e24e4272d47bd1356310a46004e24e1e252f9aadcf4653123a0')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --target-dir "./target"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
