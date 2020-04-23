# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="python-flask-restful-hal"
pkgver="0.2.4"
pkgrel="1"
pkgdesc="An extension for flask-restful to support the creation of APIs conforming to HAL."
arch=("any")
url="https://github.com/sciapp/flask-restful-hal"
license=("MIT")
depends=("python" "python-flask" "python-flask-restful" "python-future")
makedepends=("python-setuptools")
source=("https://github.com/sciapp/flask-restful-hal/archive/v${pkgver}.tar.gz")
sha256sums=("f859e7f4262401eb3fed3d48061efce6ffec5a1f7c2c9db01a4c11e081987d01")

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
