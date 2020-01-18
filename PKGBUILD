# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

pkgname=sdate
pkgver=0.5
pkgrel=1
pkgdesc="Wrapper program to output the eternal September 1993 date."
arch=('x86_64')
url="http://www.df7cb.de/projects/sdate/"
license=('GPL')
depends=('bash')
source=("https://github.com/df7cb/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('9d01b7e39ba41aea577ae079c615fcaf8695cdf568fc9c1c8f91cbee64a0723d')

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
