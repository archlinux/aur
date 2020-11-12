# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Florian Schweikert <kelvan@ist-total.org>

pkgname=python-pyotherside
_pyname=pyotherside
pkgver=1.5.8
pkgrel=3
pkgdesc='Asynchronous Python 3 Bindings for Qt5'
arch=('x86_64')
url='https://thp.io/2011/pyotherside'
license=('ISC')
depends=('python' 'qt5-base' 'qt5-declarative' 'qt5-svg')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/thp/${_pyname}/archive/${pkgver}.tar.gz")
sha256sums=('7e4ba2b601eb2d67618e0355cc249ed7d2555940af24f84bb4cbf31eb7df7808')

build() {
	cd "${_pyname}-${pkgver}/"

	qmake-qt5
	make
}

package() {
	cd "${_pyname}-${pkgver}/"

	make INSTALL_ROOT="${pkgdir}/" install

	rm -r "${pkgdir}/usr/tests"
}
