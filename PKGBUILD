# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=dust
pkgver=0.4.0
pkgrel=1
pkgdesc="du + rust = dust. Like du but more intuitive"
url="https://github.com/bootandy/dust"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bootandy/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('add53c3c5ba20bcabdd7c4746d7c72a3a259337b12bf0b5c8f25685254f61de61cc5dba9e68fbf4d327e3b5dec2aa39a73932f6e4d585c7f2b4fbbefda4dba3b')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
