# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('7482 31EB CBD8 08A1 4F5E  85D2 8C00 4C2F 9348 1F6B')
# Past maintainer: Max Roder <maxroder@web.de>

pkgname=weplab
pkgver=0.1.5
pkgrel=6
pkgdesc="A WEP encryption cracker"
url="http://sourceforge.net/projects/weplab"
arch=('x86_64' 'i686')
license=('GPL')
depends=('libpcap')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('5df9292a1556eab0f639c69e30c8109976484c92bced893bd004a3ecac86d0b986354138163fee79da3db1d44d48deb182f1e97188a1c6cb748c5558c5d2c16d')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure CFLAGS='-std=gnu89' --prefix=/usr --mandir=/usr/share/man
	make 
	make DESTDIR=${pkgdir} install
}

