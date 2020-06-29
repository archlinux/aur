# Maintainer: Michael Clayfield <me@michaelclayfield.com>
pkgname=python-alerta-client
pkgver=8.0.0
pkgrel=1
pkgdesc="Unified CLI, terminal GUI and python SDK for the Alerta monitoring system"
arch=('any')
url="https://github.com/alerta/python-alerta-client"
license=('APACHE')
makedepends=('python-setuptools')
depends=('python' 'python-click' 'python-pytz' 'python-requests' 'python-tabulate' 'python-requests-hawk')
source=("https://github.com/alerta/python-alerta-client/archive/v$pkgver.tar.gz")
sha256sums=('bb8382cb2e6b9b585ed98f5bca14381a60a3fec6993d78dc06d2157afd1c8a7c')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}"
}
