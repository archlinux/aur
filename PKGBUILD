# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-africanelephantdatabasedatadownloader"
pkgver=0.0.6
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

source=("https://gitlab.com/helics-lab/python-africanelephantdatabasedatadownloader/uploads/408b355d9a3b65b2d9c1704babf5bb81/africanelephantdatabasedatadownloader-0.0.6.tar.gz")
sha512sums=("6a11717a8f540f265dff129595c8b58745a878ec11d0d092e318f36b3825294a517097545e77b1415c108ffd5904dc28056c736e0ac6eb8892059a019ca8859e")

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
