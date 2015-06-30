# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Rodrigo S. Wanderley <rodrigoswanderley@gmail.com>

pkgname=netsed
pkgver=1.2
pkgrel=3
pkgdesc="Alter the contents of packets forwarded through network in real time"
arch=('i686' 'x86_64')
url='http://silicone.homelinux.org/projects/netsed/'
license=('GPL')
source=("http://silicone.homelinux.org/release/netsed/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0a7f12bac83d02c6fc837055bf4ff02c1bdfc8ea478227afcc762e92d1661c80')

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

