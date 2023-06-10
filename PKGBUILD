# Maintainer: Biltu Das <billionto@gmail.com>
pkgname=qsort
pkgver=0.3.3_beta
pkgrel=1
pkgdesc="Advanced file sorter for archlinux"
arch=('any')
url="https://github.com/BiltuDas1/qsort"
license=('CPL')
depends=('cmake>=3.22' 'tar')
source=("https://github.com/BiltuDas1/$pkgname/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=("0a7980857d07789a28abb9afc71e4a6834eb59aa9e1b47dc1f41bf1f90d09615")

prepare(){
	cd "$srcdir/$pkgname-${pkgver//_/-}"
	cmake -B build .
}

build(){
	cd "$srcdir/$pkgname-${pkgver//_/-}/build"
	make
}

package(){
	cd "$srcdir/$pkgname-${pkgver//_/-}/build"
	make DESTDIR="$pkgdir/" install
}
