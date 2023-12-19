# Maintainer: Madison Lynch <madi@mxdi.xyz>
pkgname='dynamicarray'
pkgver=2.0
pkgrel=3
pkgdesc="dynamic arrays in C"
arch=('x86_64')
url="https://gitlab.com/deadgirl/dynamicarray"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')
source=("${pkgname}.tar.gz::https://gitlab.com/deadgirl/${pkgname}/-/archive/master/${pkgname}-master.tar.gz")
md5sums=('SKIP')

package() {
	cd "$srcdir/$pkgname-master"
	make
	install -Dm755 "./libdynamicarray.so" "$pkgdir/usr/lib/libdynamicarray.so"
	install -Dm644 "include/dynamicarray.h" "$pkgdir/usr/include/dynamicarray.h"
}