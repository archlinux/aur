# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="python-yacl"
pkgver="0.3.4"
pkgrel="1"
pkgdesc="Yet another color logger for Python."
arch=("any")
url="https://github.com/IngoHeimbach/yacl"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/IngoHeimbach/yacl/archive/v${pkgver}.tar.gz")
sha256sums=("37038e2d3798a6a0486aacb5721e5a21fb6476a08f60beb1af42a6608b6adf0d")

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
