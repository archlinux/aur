# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

pkgname=sdate
pkgver=0.6
pkgrel=1
pkgdesc="Wrapper program to output the eternal September 1993 date."
arch=('x86_64')
url="http://www.df7cb.de/projects/sdate/"
license=('GPL')
depends=('bash')
source=("https://github.com/df7cb/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ff1d4b34144775a06884490a0aa51f5e212a4319b3ea208c376f7e0ad7a23986')

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
