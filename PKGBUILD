# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-webis
pkgver=0.3.0
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

source=("https://gitlab.com/christoph.fink/python-webis/uploads/0a2fee28159936e93f62e98822ef3e9d/webis-0.3.0.tar.gz")
sha256sums=("3579aa8bfb738518646c4ad2df0ea71dacb34ddc96adf45485c68d9cf8956d5c")

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
