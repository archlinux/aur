# Maintainer: Johannes Blaser <Johannes.Blaser@gmail.com>

pkgname=python-geographiclib
pkgver=1.49
pkgrel=2
pkgdesc="This is a python implementation of the geodesic routines in GeographicLib."
url="https://geographiclib.sourceforge.io/1.49/python/"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/5b/ac/4f348828091490d77899bc74e92238e2b55c59392f21948f296e94e50e2b/geographiclib-${pkgver}.tar.gz")
sha256sums=('635da648fce80a57b81b28875d103dacf7deb12a3f5f7387ba7d39c51e096533')

build() {
	cd "geographiclib-${pkgver}"
	python setup.py build
}

check() {
	cd "geographiclib-${pkgver}"
	python setup.py test
}

package() {
	cd "geographiclib-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1
}
