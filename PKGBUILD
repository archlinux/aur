# Maintainer: Yigit Sever <yigit at yigitsever dot com>
pkgname=python-pyrdfa3
_pkgname=pyrdfa3
pkgver=3.5.2
pkgrel=1
pkgdesc="Python distiller/parser library"
arch=('any')
url="https://github.com/RDFLib/pyrdfa3"
license=('custom')
depends=('python-rdflib')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('2cf88994c9726eae043d24c2b6945ec2d0bf5c417e29dfd86cb5170884015905')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
