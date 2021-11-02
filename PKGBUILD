# Maintainer: opale95
# Contributor: Namarrgon
pkgname=lebiniou-data
pkgver=3.63.0
pkgrel=1
pkgdesc="Data files for lebiniou"
arch=('any')
url="https://biniou.net/"
license=('GPL')
source=("https://gitlab.com/lebiniou/lebiniou-data/-/archive/version-$pkgver/lebiniou-data-version-$pkgver.tar.gz")
sha256sums=('4485db89ce1a79e3cabc0c8d7dc2c0a7678b66cf4a6c25000c77fa2cc4475e6d')

build() {
	cd "$pkgname-version-$pkgver"

	./bootstrap
	./configure --prefix=/usr
}

package() {
	cd "$pkgname-version-$pkgver"

	make DESTDIR="$pkgdir/" install
}

