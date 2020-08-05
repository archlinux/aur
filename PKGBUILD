# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-flask-restful-hal"
pkgver="0.2.6"
pkgrel="2"
pkgdesc="An extension for flask-restful to support the creation of APIs conforming to HAL."
arch=("any")
url="https://github.com/sciapp/flask-restful-hal"
license=("MIT")
depends=("python" "python-flask" "python-flask-restful" "python-future")
makedepends=("python-setuptools")
source=("https://github.com/sciapp/flask-restful-hal/archive/v${pkgver}.tar.gz")
sha256sums=("3cfb68a163d093bf7542753be8c6e8e3b40b5f1e51a6721db4df998482eff74b")

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
