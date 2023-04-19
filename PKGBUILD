# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-attr"
pkgver="0.3.2"
pkgrel="1"
pkgdesc="Simple decorator to set attributes of target function or class in a DRY way."
arch=("any")
url="https://github.com/denis-ryzhkov/attr"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/denis-ryzhkov/attr/archive/${pkgver}.tar.gz")
sha256sums=("092be21d22755cd803c184d68e3a9867836727a451aac640840bb81daf4f4e52")

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
