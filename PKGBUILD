# Maintainer: Ingo Meyer <IJ_M@gmx.de>

pkgname="radiotray-ng-mpris"
pkgver="0.0.0"
pkgrel="1"
pkgdesc="A wrapper script for Radiotray-NG which provides an MPRIS2 interface."
arch=("any")
url="https://github.com/IngoMeyer441/radiotray-ng-mpris"
license=("MIT")
depends=(
    "python"
    "python-mpris_server"
    "python-pydbus"
    "python-yacl"
    "radiotray-ng"
)
makedepends=("python-setuptools")
source=("https://github.com/IngoMeyer441/radiotray-ng-mpris/archive/v${pkgver}.tar.gz")
sha256sums=("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    python setup.py install --optimize=1 \
                            --prefix=/usr \
                            --root="${pkgdir}" \
                            --skip-build
}
