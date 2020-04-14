# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="python-yacl"
pkgver="0.3.2"
pkgrel="1"
pkgdesc="Yet another color logger for Python."
arch=("any")
url="https://github.com/IngoHeimbach/yacl"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/IngoHeimbach/yacl/archive/v${pkgver}.tar.gz")
sha256sums=("da5c11a60210b062c6c3c55ca3d1e1492cc4dd540edc55a1100ad05f24d89b99")

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
