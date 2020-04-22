# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=dwdweather2
pkgname=python-${_pkgname}
pkgver=0.12.0
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
sha256sums=('f3107b8d23092c4a3b628e9853f26724f34de62a69ba73c1ccfee7f0fc99836b')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
