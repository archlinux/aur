# AUR Category: devel
# Maintainer: Alexander Koch <lynix47@gmail.com>

pkgname=ptxdist-2018.02
_realname=ptxdist
pkgver=2018.02.0
pkgrel=1
pkgdesc="Embedded Linux build system, pinned 2018.02 release"
arch=('x86_64')
url="http://www.ptxdist.org"
license=('GPL')
depends=('dialog' 'flex' 'bison' 'patch' 'python2')
source=("http://www.pengutronix.de/software/ptxdist/download/${_realname}-${pkgver}.tar.bz2")
sha256sums=('085f0f2021f3fc5c1853011ca87c594f577eede87e7897bac3f5763909f1d21b')

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
