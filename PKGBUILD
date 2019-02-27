# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-webis
pkgver=0.2.6
pkgrel=0

pkgdesc="Python wrapper for the webis Twitter sentiment identification tool"
url="https://gitlab.com/christoph.fink/python-webis"
license=("GPLv3")

arch=("any")
makedepends=(
    "python-setuptools"
)
depends=(
    "java-environment"
    "java-runtime"
    "python-emojientities"
    "python-gitpython"
    "python-pandas"
    "python-pyjnius"
)

source=("https://gitlab.com/christoph.fink/python-webis/uploads/8e01d3fc920d335da218c88ef77d4ed8/webis-0.2.6.tar.gz")
sha256sums=("610824a5f440db9d15e7b2714a24babf3fbfa7b5d9680e4599ce8ff6db3ec940")

prepare() {
    rm -Rf "${srcdir}/*/*.egg-info"
}

build() {
    cd "${srcdir}/webis-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/webis-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

}
