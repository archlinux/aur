# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Rodrigo S. Wanderley <rodrigoswanderley@gmail.com>

pkgname=netsed-opt
pkgver=1.3
pkgrel=1
pkgdesc="Optionally alter the contents of packets forwarded through network in real time"
arch=('x86_64')
url='https://gitlab.com/Scrumplex/netsed-opt'
license=('GPL')
source=("https://gitlab.com/Scrumplex/netsed-opt/-/archive/${pkgver}/netsed-opt-${pkgver}.tar.gz")
sha512sums=('150619161c00a9d2e3efda6f332a124bb239ebbda06bb99ca6ed160b7529ae1a059b2a84bf999e20f5a287e349ba12339f9d5f59a9e5522e1c6c84f356703865')

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
