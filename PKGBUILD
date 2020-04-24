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
sha256sums=("986a548a2838e551edf37a15837e98fd1e5b4776eb2c544f27b7ab774e0298ad")

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
