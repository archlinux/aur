# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=dwdweather2
pkgname=python-${_pkgname}
pkgver=0.14.0
pkgrel=3
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
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/panodata/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('876b83b0e008e001e7ad73e366981aa0eab88e966ecd9cffdfb3fae57198957c')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
