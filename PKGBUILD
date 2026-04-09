# Maintainer: j.r <j.r@jugendhacker.de>
# Contributor: Loui Chang <base64:bG91aXBjLmlzdEBnbWFpbC5jb20=>
# Contributor: Jeff Mickey <j@codemac.net>

pkgname=libvc
pkgver=013
pkgrel=1
pkgdesc="vCard library."
arch=('i686' 'x86_64')
url="https://github.com/$pkgname/$pkgname"
license=("LGPL-2.1-or-later")
depends=('glibc')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.sig::$url/releases/download/v$pkgver/v$pkgver.tar.gz.sig")

validpgpkeys=('3F464391498FE874BDB5D98F2124AA1983785C90')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	autoreconf -f -i
	./configure --prefix=/usr
	make
}

check() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make check
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}

md5sums=('f0cc94c3bc0ab6f42ff6c40f2c587a40'
         'SKIP')
