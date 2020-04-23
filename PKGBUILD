# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="python-flask-restful-hal"
pkgver="0.2.3"
pkgrel="1"
pkgdesc="An extension for flask-restful to support the creation of APIs conforming to HAL."
arch=("any")
url="https://github.com/sciapp/flask-restful-hal"
license=("MIT")
depends=("python" "python-flask" "python-flask-restful" "python-future")
makedepends=("python-setuptools")
source=("https://github.com/sciapp/flask-restful-hal/archive/v${pkgver}.tar.gz")
sha256sums=("63e796d9e926fae65f48044368750ed6bc825bac1f1e9c53c85169d863a7a60f")

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
