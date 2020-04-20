# Maintainer: Michael Clayfield <me@michaelclayfield.com>
pkgname=python-alerta-client
pkgver=7.5.0
pkgrel=1
pkgdesc="Unified CLI, terminal GUI and python SDK for the Alerta monitoring system"
arch=('any')
url="https://github.com/alerta/python-alerta-client"
license=('APACHE')
makedepends=('python-setuptools')
depends=('python' 'python-click' 'python-pytz' 'python-requests' 'python-tabulate' 'python-requests-hawk')
source=("https://github.com/alerta/python-alerta-client/archive/v$pkgver.tar.gz")
sha256sums=('8ca1847aaf1b06356e9ee2d4bd80db9b95e1906cb4f5ed23f8152e59690b1ba8')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}"
}
