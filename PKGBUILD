# Maintainer: AdriDoesThings <adri@adridoesthings.com>

pkgname=fibonacci
pkgrel=1
pkgver=1.0
pkgdesc="A very simple fibonacci sequence implementation"
arch=('any')
url="https://github.com/AdriDevelopsThings/fibonacci"
depends=('gmp')
source=(https://adridoesthings.com/pub/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('b9f5ab047703809e21a9106588ed04df8e98f531dd16516986ac4ca180c2bf27'
	'SKIP')
validpgpkeys=('94202C7FD9025BA4C574623981EDEA6080EEE7BF')

prepare() {
	cd $pkgname-$pkgver
}

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
