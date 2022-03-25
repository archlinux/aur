# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# vim: ft=sh:
pkgname=kaiso
pkgver=1
pkgrel=1
pkgdesc="A TCP service router"
arch=('x86_64')
url="https://github.com/42LoCo42/kaiso"
license=('AGPL')
makedepends=('nim')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a09799a5c234d2e592555c0f8451b1ad11fbafcffa9a4b1348cf8b7697683738')

build() {
	cd "$pkgname-$pkgver" || exit 1
	make
}

package() {
	cd "$pkgname-$pkgver" || exit 1
	make DESTDIR="$pkgdir/" install
}
