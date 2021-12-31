# Maintainer: opale95
# Contributor: Namarrgon
pkgname=lebiniou-data
pkgver=3.64.0
pkgrel=1
pkgdesc="Data files for lebiniou"
arch=('any')
url="https://biniou.net/"
license=('GPL')
source=("https://gitlab.com/lebiniou/lebiniou-data/-/archive/version-$pkgver/lebiniou-data-version-$pkgver.tar.gz")
sha256sums=('940545a3a42c30a8c1e83e2971dec7e132d9c2f9a6a564a9cc22a551d427e3f0')

build() {
	cd "$pkgname-version-$pkgver"

	./bootstrap
	./configure --prefix=/usr
}

package() {
	cd "$pkgname-version-$pkgver"

	make DESTDIR="$pkgdir/" install
}

