# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: goodmen <goodmenlinux@gmail.com>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>
# Originally contributed by champus, madeye, Ranguvar and ninja_pt

pkgname=ipmiutil
pkgver=2.8.7
pkgrel=2
pkgdesc="A simple program that lists results from the hardware detection library."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ipmiutil/"
license=('BSD')
depends=('openssl')
options=('!emptydirs')
changelog=ChangeLog
source=("http://prdownloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('a1686f1d09c4964c0fd7e8a40bb88cd3')

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --enable-gpl
	make
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/ipmiutil/LICENSE"
}
