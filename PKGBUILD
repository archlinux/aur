# Maintainer: Michael Clayfield <me@michaelclayfield.com>
pkgname=python-alerta-client
pkgver=8.3.0
pkgrel=1
pkgdesc="Unified CLI, terminal GUI and python SDK for the Alerta monitoring system"
arch=('any')
url="https://github.com/alerta/python-alerta-client"
license=('APACHE')
makedepends=('python-setuptools')
depends=('python' 'python-click' 'python-pytz' 'python-requests' 'python-tabulate' 'python-requests-hawk')
source=("https://github.com/alerta/python-alerta-client/archive/v$pkgver.tar.gz")
sha256sums=('adbf61838fa7b8c71f5830c1584ed96e3ad07cfbe55a6b8ba9b0b7f1f5d51e5c')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}"
}
