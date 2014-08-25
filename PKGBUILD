# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: goodmen <goodmenlinux@gmail.com>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>
# Originally contributed by champus, madeye, Ranguvar and ninja_pt

pkgname=ipmiutil
pkgver=2.9.4
pkgrel=1
pkgdesc="A simple program that lists results from the hardware detection library."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ipmiutil/"
license=('BSD')
depends=('openssl')
options=('!emptydirs')
changelog=ChangeLog
source=("http://prdownloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('9d6435e943d1597469994167a0c7f22c')

build()
{
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --enable-gpl --libdir=/usr/lib --bindir=/usr/bin
	make
}

package()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/ipmiutil/LICENSE"
}
