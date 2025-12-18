# Maintainer: DrRac27 <drrac27 at riseup dot net>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Florian Schweikert <kelvan@ist-total.org>

pkgname=python-pyotherside-qt6
_pyname=pyotherside
pkgver=1.6.2
pkgrel=1
pkgdesc='Asynchronous Python 3 Bindings for Qt6'
arch=('x86_64')
url='https://thp.io/2011/pyotherside'
license=('ISC')
depends=('python' 'qt6-base' 'qt6-declarative' 'qt6-svg')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/thp/${_pyname}/archive/${pkgver}.tar.gz")
sha256sums=('9afe075f165c78ec584892887a6411fe1476f2115cf3bba026105bde29292a4b')

build() {
	cd "${_pyname}-${pkgver}/"

	qmake6
	make
}

package() {
	cd "${_pyname}-${pkgver}/"

	make INSTALL_ROOT="${pkgdir}/" install

	rm -r "${pkgdir}/usr/tests"
}
