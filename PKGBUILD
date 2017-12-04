# Maintainer: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=sipvicious
pkgver=0.2.8
pkgrel=2
pkgdesc="Tools for auditing SIP devices"
arch=('i686' 'x86_64')
url="http://blog.sipvicious.org"
license=('GPLv2')
depends=('python2')
install=sipvicious.install
source=("https://github.com/EnableSecurity/${pkgname}/archive/v${pkgver}.tar.gz")
conflicts=('sipvicious-svn')
sha1sums=('6b0af366109bf0e8922cc97578d70b7a6c5913c8')

build() {
	msg "No build..."
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	chmod 755 *.py
	sed -i "s:/usr/bin/env python:/usr/bin/env python2:" *.py
	install -d -m 755 ${pkgdir}/usr/bin
	install -d -m 755 ${pkgdir}/usr/share
	mv ${srcdir}/${pkgname}-${pkgver} ${pkgdir}/usr/share/${pkgname}
}
