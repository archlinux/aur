# Maintainer: Max Roder <maxroder@web.de>

pkgname=weplab
pkgver=0.1.5
pkgrel=3
pkgdesc="A WEP encryption cracker"
url="http://sourceforge.net/projects/weplab"
arch=('x86_64' 'i686')
license=('GPL')
depends=('libpcap')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('91e4425f474d5b3213effc6d532aa3ee2fb121a1942e43c08210780a4759a72b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --prefix=/usr --mandir=/usr/share/man
	make || return 1
	make DESTDIR=${pkgdir} install
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
