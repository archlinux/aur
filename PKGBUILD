# Maintainer: Michael Clayfield <me@michaelclayfield.com>
pkgname=python-alerta-client
pkgver=7.4.4
pkgrel=1
pkgdesc="Unified CLI, terminal GUI and python SDK for the Alerta monitoring system"
arch=('any')
url="https://github.com/alerta/python-alerta-client"
license=('APACHE')
makedepends=('python-setuptools')
depends=('python' 'python-click' 'python-pytz' 'python-requests' 'python-tabulate' 'python-requests-hawk')
source=("https://github.com/alerta/python-alerta-client/archive/v$pkgver.tar.gz")
sha256sums=('d06ad0893ea760fb9726172a31b3d47dbaafc0fcd84b0d6f59a01f0c5bf2f8b6')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}"
}
