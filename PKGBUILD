# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-gitlab-registry-usage-rest"
pkgver="0.3.0"
pkgrel="1"
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
sha256sums=("dee87cf32f8c9aab5b403a1e5f1c9113e98440a3f3d8ef63b3216fcfa7bfa52e")

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
