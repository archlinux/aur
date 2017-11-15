# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Florian Schweikert <kelvan@ist-total.org>

pkgname=python-pyotherside
_pyname=pyotherside
pkgver=1.5.0
pkgrel=3
pkgdesc='Asynchronous Python 3 Bindings for Qt5'
arch=('x86_64')
url='https://thp.io/2011/pyotherside'
license=('ISC')
depends=('python' 'qt5-base' 'qt5-declarative' 'qt5-svg')
source=("https://thp.io/2011/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('762105610f3ed1d75d90313219e0f8ee5b2672bb893f03ccba9d64082a0bd388')

build() {
	cd "${_pyname}-${pkgver}/"

	qmake-qt5
	make
}

package() {
	cd "${_pyname}-${pkgver}/"

	make INSTALL_ROOT="${pkgdir}/" install
}
