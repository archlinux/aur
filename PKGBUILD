# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Florian Schweikert <kelvan@ist-total.org>

pkgname=python-pyotherside
_pyname=pyotherside
pkgver=1.6.1
pkgrel=2
pkgdesc='Asynchronous Python 3 Bindings for Qt5'
arch=('x86_64')
url='https://thp.io/2011/pyotherside'
license=('ISC')
depends=('python' 'qt5-base' 'qt5-declarative' 'qt5-svg')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/thp/${_pyname}/archive/${pkgver}.tar.gz")
sha256sums=('d8ce8383990635472be98461f12c2352e98bc8351faa3416e6fa4679f8f08f06')

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
