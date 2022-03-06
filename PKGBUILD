# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=modbus-tk
pkgname="python-${_pkgname}-git"
pkgver=r180.c168f71
pkgrel=3
pkgdesc="Create Modbus app easily with Python"
arch=("any")
url="https://github.com/ljean/${_pkgname}"
license=("MIT")
depends=(
    "python"
    "python-pyserial"
)
provides=("${_pkgname}" "python-${_pkgname}")
conflicts=("python-modbus-tk")
source=("git+${url}.git")
sha512sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="$pkgdir" --optimize=1
}
