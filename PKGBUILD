# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

pkgname=sdate
pkgver=0.7
pkgrel=1
pkgdesc="Wrapper program to output the eternal September 1993 date."
arch=('x86_64')
url="http://www.df7cb.de/projects/sdate/"
license=('GPL')
depends=('bash')
source=("https://github.com/df7cb/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7e1b3644d7b019ccb7ab3997e1f88e1e7a8946685cb16eafce88a97cd1d2d6d1')

prepare() {
	cd "$pkgname-$pkgver"
    aclocal
    autoheader
    libtoolize
    automake --add-missing
    autoconf
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
