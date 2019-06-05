# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Rodrigo S. Wanderley <rodrigoswanderley@gmail.com>

pkgname=netsed
pkgver=1.3
pkgrel=1
pkgdesc="Alter the contents of packets forwarded through network in real time"
arch=('i686' 'x86_64')
url='http://silicone.homelinux.org/projects/netsed/'
license=('GPL')
validpgpkeys=('E312A31DBEC374CCC49E6D698B306538D00E52B6') # Julien Viard de Galbert <julien@vdg.blogsite.org>
source=("http://silicone.homelinux.org/release/netsed/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('f0891285442c9a4701e2b7fc7d28f2834a5352f94295649d1fdb60da1eca81aa'
            'SKIP')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	install -D -m 0755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}

	install -D -m 0644 LICENSE ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
	install -D -m 0644 NEWS ${pkgdir}/usr/share/doc/${pkgname}/NEWS
	install -D -m 0644 README ${pkgdir}/usr/share/doc/${pkgname}/README
	install -D -m 0644 TODO ${pkgdir}/usr/share/doc/${pkgname}/TODO
}

