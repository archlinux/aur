# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=python-pytest-kwparametrize
pkgver=0.0.3
pkgrel=3
pkgdesc='Alternate syntax for @pytest.mark.parametrize with test cases as dictionaries and default value fallbacks'
arch=('any')
url=https://github.com/akaihola/pytest-kwparametrize
license=('MIT')
depends=('python'
	'python-pytest')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/pytest_kwparametrize-${pkgver}.tar.gz")
sha512sums=('16b46c93d4e16d155bdea2d80fa984437d81786fcf69a8534129355597b0187540004244985b0a443971cb301ff1c5132920037f39dd63c0cd2b439ca445d5d0')

build() {
	cd "pytest_kwparametrize-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "pytest_kwparametrize-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
