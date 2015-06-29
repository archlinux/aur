# Maintainer: Christian Heses <mail@eworm.de>
# Contributor: Marti Raudsepp <marti@juffo.org>

pkgname=ssss
pkgver=0.5
pkgrel=4
pkgdesc="Simple command-line implementation of Shamir's Secret Sharing Scheme"
arch=('i686' 'x86_64')
license=('GPL')
url="http://point-at-infinity.org/ssss/"
depends=('gmp')
makedepends=('xmltoman')
source=("http://point-at-infinity.org/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha1sums=('3f8f5046c2c5c3a2cf1a93f0a9446681852b190e')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}/

	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/

	install -D -m0755 ssss-combine ${pkgdir}/usr/bin/ssss-combine
	install -D -m0755 ssss-split ${pkgdir}/usr/bin/ssss-split

	install -D -m0644 ssss.1 ${pkgdir}/usr/share/man/man1/ssss.1

	install -D -m0755 doc.html ${pkgdir}/usr/share/doc/${pkgname}/doc.html
	install -D -m0755 ssss.1.html ${pkgdir}/usr/share/doc/${pkgname}/ssss.1.html
}
