# Maintainer: Ethan Zonca <e@ethanzonca.com>
pkgname=arm-linux-gnueabi-uthash
_pkgname=uthash
pkgver=1.9.9
pkgrel=1
pkgdesc="C preprocessor implementations of a hash table and a linked list"
url="https://troydhanson.github.io/uthash/index.htm"
arch=('any')
license=('BSD')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/troydhanson/$_pkgname/archive/v$pkgver.tar.gz")

md5sums=('c3ce9197c818dcb7ca85b59912f310a4')

options=(!buildflags !libtool !emptydirs !strip ccache)

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}/src
 

	install -dm755 "${pkgdir}"/usr/arm-linux-gnueabi/include/

	for h in *.h; do
		install -m 644 ${h} "${pkgdir}"/usr/arm-linux-gnueabi/include/
	done
}
