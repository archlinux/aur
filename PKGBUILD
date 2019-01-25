# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-webis
pkgver=0.2.1
pkgrel=0

pkgdesc="Python wrapper for the webis Twitter sentiment identification tool"
url="https://gitlab.com/christoph.fink/python-webis"
license=("GPLv3")

arch=("any")
makedepends=(
    "java-environment"
    "java-runtime"
    "python-gitpython"
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

source=("https://gitlab.com/christoph.fink/python-webis/uploads/9772ef8d4e8644679cc6f00d920b4346/webis-0.2.1.tar.gz")
sha256sums=("44f5fb55655c77a39f1a351100bc361bda88d33b6c5ab612798b7389a11f0a41")

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
