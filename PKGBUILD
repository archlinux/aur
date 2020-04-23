# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="python-yacl"
pkgver="0.3.3"
pkgrel="1"
pkgdesc="Yet another color logger for Python."
arch=("any")
url="https://github.com/IngoHeimbach/yacl"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/IngoHeimbach/yacl/archive/v${pkgver}.tar.gz")
sha256sums=("dedf4a4f1edc6073f15c3eac4f4b7ed852ef65bef8881074fe32b5c28eae07cf")

build() {
    cd "${srcdir}/${pkgname#*-}-${pkgver}" || return
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname#*-}-${pkgver}" || return
    python setup.py install --optimize=1 \
                            --prefix=/usr \
                            --root="${pkgdir}" \
                            --skip-build
}
