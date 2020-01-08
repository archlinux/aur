# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-africanelephantdatabasedatadownloader"
pkgver=0.0.0
pkgrel=0

pkgdesc="Download data from the African Elephant Database"
url="https://gitlab.com/helics-lab/python-africanelephantdatabasedatadownloader"
license=("GPLv3")

arch=("any")
makedepends=(
    "python-setuptools"
    "python-versioneer"
)
depends=(
    "python-beautifulsoup4"
    "python-geopandas"
    "python-requests"
    "python-shapely"
)

source=("")
sha256sums=("")

prepare() {
    rm -Rf "${srcdir}/*/*.egg-info"
}

build() {
    cd "${srcdir}/africanelephantdatabasedatadownloader-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/africanelephantdatabasedatadownloader-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

}
