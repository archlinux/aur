# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-gitlab-registry-usage-rest"
pkgver="0.2.6"
pkgrel="2"
pkgdesc="A restful web service for querying the repository sizes of a GitLab registry."
arch=("any")
url="https://github.com/sciapp/gitlab-registry-usage-rest"
license=("MIT")
depends=("python" "python-cheroot" "python-flask" "python-flask-cors"
         "python-flask-httpauth" "python-flask-jwt-extended"
         "python-flask-restful" "python-flask-restful-hal"
         "python-gitlab-registry-usage" "python-ldap3")
makedepends=("python-setuptools")
optdepends=("python-json2html: html support")
source=("https://github.com/sciapp/gitlab-registry-usage-rest/archive/v${pkgver}.tar.gz")
sha256sums=("90da05087839a774cb5f605d58a75d22b6a00f55437811e6d91596d65c6b1c13")

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
