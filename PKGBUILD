# Maintainer: Michael Clayfield <me@michaelclayfield.com>
pkgname=python-alerta-client
pkgver=7.2.2
pkgrel=1
pkgdesc="Unified CLI, terminal GUI and python SDK for the Alerta monitoring system"
arch=('any')
url="https://github.com/alerta/python-alerta-client"
license=('APACHE')
makedepends=('python-setuptools')
depends=('python' 'python-click' 'python-pytz' 'python-requests' 'python-tabulate')
source=("https://github.com/alerta/python-alerta-client/archive/v$pkgver.tar.gz")
sha256sums=('c7fdb09a1f9fc1df59393e50226d0ef131bb3a43948b942cbbfc9001d0842077')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}"
}
