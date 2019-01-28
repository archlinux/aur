# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-webis
pkgver=0.2.3
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

source=("https://gitlab.com/christoph.fink/python-webis/uploads/f2acc47ab0c3228d90d3b3325910a2eb/webis-0.2.3.tar.gz")
sha256sums=("7994cf9bbd567b4449ebd3e2dcb6efcef38597231b60e0f64041fc4fb1db77cc")

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
