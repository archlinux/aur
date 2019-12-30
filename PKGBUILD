# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=dust
pkgver=0.4.3
pkgrel=1
pkgdesc="du + rust = dust. Like du but more intuitive"
url="https://github.com/bootandy/dust"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bootandy/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('9b405a29b3535ac5e8a4b455ebf735279ecfbdb181b6ba5567770a38eba78e4cb3e04a26b639ce74afd82a50e3cb28cb8918ebb188a9e566706af1507f34f8cb')

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
