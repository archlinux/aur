# $Id: PKGBUILD 40906 2011-03-01 14:45:04Z andrea $
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Adam 'battlemidget' Stokes <adam.stokes@gmail.com> 

pkgname=libast
pkgver=0.7
pkgrel=3
pkgdesc="The Library of Assorted Spiffy Things."
arch=('i686' 'x86_64')
url="http://eterm.sourceforge.net"
license=('BSD')
depends=('imlib2' 'pcre' 'libsm')
options=('!libtool')
source=(http://www.eterm.org/download/${pkgname}-${pkgver}.tar.gz LICENSE.txt)
md5sums=('a9ec3b2da317f35869316e6d9571d296'
         '97071898559acc4f900ceb6cb9579492')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	./configure --prefix=/usr --with-x
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make prefix=${pkgdir}/usr install
	install -Dm644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
