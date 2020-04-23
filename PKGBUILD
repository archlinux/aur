# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="python-flask-restful-hal"
pkgver="0.2.1"
pkgrel="1"
pkgdesc="An extension for flask-restful to support the creation of APIs conforming to HAL."
arch=("any")
url="https://github.com/sciapp/flask-restful-hal"
license=("MIT")
depends=("python" "python-flask" "python-flask-restful" "python-future")
makedepends=("python-setuptools")
source=("https://github.com/sciapp/flask-restful-hal/archive/v${pkgver}.tar.gz")
sha256sums=("5082ae19812e88d601cdf635feee70a2e57eae0a2e0c017645ecfc191e1d21d7")

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
