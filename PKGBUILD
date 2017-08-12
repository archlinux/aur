# Maintainer: danitool dgcbueu at gmail.com

pkgname=osd_clock
pkgver=0.6
pkgrel=1
pkgdesc="A clock which uses the X On-Screen Display library"
arch=('i686' 'x86_64')
source=("https://github.com/danitool/osd_clock/archive/${pkgver}.tar.gz")
license=('GPL2')
depends=('xosd')
makedepends=('make')
md5sums=('93baed0d1bf3e81e649ac27c84fa8c18')

prepare(){
	cd ${srcdir}/${pkgname}-${pkgver}
}

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make || return 1
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	install -D -m 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
	install -D -m 644 ${pkgname}.1 ${pkgdir}/usr/share/man/man1/${pkgname}.1
}
