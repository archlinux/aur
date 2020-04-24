# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="python-gitlab-registry-usage"
pkgver="0.2.5"
pkgrel="1"
pkgdesc="An extension for flask-restful to support the creation of APIs conforming to HAL."
arch=("any")
url="https://github.com/sciapp/gitlab-registry-usage"
license=("MIT")
depends=("python" "python-pyopenssl" "python-requests")
makedepends=("python-setuptools")
source=("https://github.com/sciapp/gitlab-registry-usage/archive/v${pkgver}.tar.gz")
sha256sums=("3bd30eb2259097aeb430afb3ad4b1fe3f7ae19b9aa1ae779c984aa65817f5f9f")

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
