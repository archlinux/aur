# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=dwdweather2
pkgname=python-${_pkgname}
pkgver=0.11.1
pkgrel=2
pkgdesc="Client to access weather data from Deutscher Wetterdienst (DWD), the federal meteorological service in Germany"
arch=('x86_64')
url="https://github.com/panodata/dwdweather2"
license=('MIT')
depends=(
    'python-tqdm'
    'python-dateutil'
    'python-requests'
    'python-requests-cache'
    'python-beautifulsoup4'
)
makedepends=(
    'python-setuptools'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/panodata/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('89797a675e0f2a8b8f8b89ffc8d283c6ea58a099fa4d9f39defd7ce52d256466')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
