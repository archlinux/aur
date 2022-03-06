# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=modbus-tk
pkgname="python-${_pkgname}"
pkgver=1.1.2
pkgrel=2
pkgdesc="Create Modbus app easily with Python"
arch=("any")
url="https://github.com/ljean/${_pkgname}"
license=("MIT")
depends=(
    "python"
    "python-pyserial"
)
provides=("${_pkgname}" "python-${_pkgname}")
conflicts=("python-modbus-tk-git")
source=("https://files.pythonhosted.org/packages/ce/e9/30d86eb912bf868b8c97698b5747f10cf72dc26c674fd030249bc3275484/modbus_tk-1.1.2.tar.gz")
sha256sums=("893514bbd8c92118d20a19979e0239e7cb2a63f8f1795a0271e57def09d11770")

build() {
    cd "${srcdir}/${_pkgname//-/_}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname//-/_}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
