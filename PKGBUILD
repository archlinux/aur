# Maintainer: stardust95
# Contributor: Namarrgon
pkgname=lebiniou-data
pkgver=3.56.0
pkgrel=2
pkgdesc="Data files for lebiniou"
arch=('any')
url="https://biniou.net/"
license=('GPL')
depends=('lebiniou>=3.56.0')
source=("https://gitlab.com/lebiniou/lebiniou-data/-/archive/version-$pkgver/lebiniou-data-version-$pkgver.tar.gz")
sha256sums=('1667d3cd96d01bd88791f665af21a5ef875ad2d7ba20b5435c2d765075da41e1')

build() {
	cd "$pkgname-version-$pkgver"

	./bootstrap
	./configure --prefix=/usr
}

package() {
	cd "$pkgname-version-$pkgver"

	make DESTDIR="$pkgdir/" install
}

