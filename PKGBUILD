# AUR Category: devel
# Maintainer: Alexander Koch <lynix47@gmail.com>

pkgname=ptxdist-2018.12
_realname=ptxdist
pkgver=2018.12.0
pkgrel=1
pkgdesc="Embedded Linux build system, pinned 2018.12 release"
arch=('x86_64')
url="http://www.ptxdist.org"
license=('GPL')
depends=('dialog' 'flex' 'bison' 'patch' 'python2')
source=("http://www.pengutronix.de/software/ptxdist/download/${_realname}-${pkgver}.tar.bz2")
md5sums=(''d690c207aa27ed2be7fd392ad2809af3)

build() {
	cd "${srcdir}/${_realname}-${pkgver}"

	./configure --prefix=/usr --with-python=/usr/bin/python2
	make
}

package() {
	cd "${srcdir}/${_realname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
	mv ${pkgdir}/usr/bin/ptxdist ${pkgdir}/usr/bin/${pkgname}
}

# vim: ts=4
