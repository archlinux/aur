# Maintainer: Matheus de Alcantara <matheus.de.alcantara@gmail.com>

pkgname=mandoc
pkgver=1.9.9
pkgrel=1
pkgdesc="A suite of tools compiling mdoc from the OpenBSD project"
arch=('x86_64' 'i686')
url='http://mdocml.bsd.lv/'
license=('ISC')
source=("http://mdocml.bsd.lv/snapshots/mdocml-${pkgver}.tar.gz"
        'mdocml-makefile.patch')
md5sums=('d54e4b67308b44f895aa09c79cc6762c'
         '585956c2741ed2b29dce9a103161cffb')
depends=('glibc')

prepare () {
	cd ${srcdir}/mdocml-${pkgver}
	patch < ${srcdir}/mdocml-makefile.patch
}

build () {
	cd ${srcdir}/mdocml-${pkgver}
	make PREFIX=/usr/
}

package () {
	cd ${srcdir}/mdocml-${pkgver}
	make install DESTDIR=${pkgdir} PREFIX=/usr/
}
