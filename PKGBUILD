# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-webis
pkgver=0.2.5
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

source=("https://gitlab.com/christoph.fink/python-webis/uploads/242262572596b1d8d7a49b6fb9cb19c0/webis-0.2.5.tar.gz")
sha256sums=("cf4fdbf4a832b7d498a2c6f6f31664c6008d7262e44aa8dfacd096c89c9c595a")

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
