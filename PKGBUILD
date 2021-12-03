# Maintainer: j.r <j.r@jugendhacker.de>
# Contributor: Loui Chang <base64:bG91aXBjLmlzdEBnbWFpbC5jb20=>
# Contributor: Jeff Mickey <j@codemac.net>

pkgname=libvc
pkgver=010
pkgrel=1
pkgdesc="vCard library."
arch=('i686' 'x86_64')
url="https://github.com/$pkgname/$pkgname"
license=("LGPL")
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

md5sums=('56fe3e7d0fb76270e6abc5437e90dfd9'
         'SKIP')
