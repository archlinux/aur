# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Past maintainer: Max Roder <maxroder@web.de>

pkgname=weplab
pkgver=0.1.5
pkgrel=7
pkgdesc="A WEP encryption cracker"
url="http://sourceforge.net/projects/weplab"
arch=('x86_64' 'i686')
license=('GPL')
depends=('libpcap')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('5df9292a1556eab0f639c69e30c8109976484c92bced893bd004a3ecac86d0b986354138163fee79da3db1d44d48deb182f1e97188a1c6cb748c5558c5d2c16d'
            'SKIP')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure CFLAGS='-std=gnu89' --prefix=/usr --mandir=/usr/share/man
	make 
	make DESTDIR=${pkgdir} install
}

