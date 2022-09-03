# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=ua608d
pkgver=1.00
pkgrel=1
epoch=
pkgdesc="Mini vMac extra for unarchiving disk images"
arch=(any)
url="https://www.gryphel.com/c/minivmac/extras/ua608d/index.html"
license=('LGPL')
depends=()
makedepends=()
optdepends=()
provides=()
source=("https://www.gryphel.com/d/minivmac/extras/${pkgname}/${pkgname}-${pkgver}.src.tgz")
noextract=()
md5sums=('797d9152bb9ff2a4d1bdc902dc47a0c8')


build() {
	cd "${pkgname}/source"
	gcc -o $pkgname -x c AAAATOOL.h \
        -include stdlib.h -include stdio.h -include string.h  -include errno.h
}

package() {
	cd "${pkgname}/source"
	install -D $pkgname "${pkgdir}/usr/bin/${pkgname}"
}
