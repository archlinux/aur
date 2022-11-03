# Maintainer: Ingo Meyer <IJ_M@gmx.de>

pkgname="radiotray-ng-mpris"
pkgver="0.1.0"
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
sha256sums=("94c6a4148cf9524547cdf629b967f07c73697e69707abd6d835334bca628ca97")

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
