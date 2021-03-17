# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-yacl"
pkgver="0.4.1"
pkgrel="1"
pkgdesc="Yet another color logger for Python."
arch=("any")
url="https://github.com/IngoMeyer441/yacl"
license=("MIT")
depends=("python" "python-pygments")
makedepends=("python-setuptools")
source=("https://github.com/IngoMeyer441/yacl/archive/v${pkgver}.tar.gz")
sha256sums=("c77c52acc144ede4e9410562ccf30d8596000a60ec6b198d243594d3e3f6fcec")

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
