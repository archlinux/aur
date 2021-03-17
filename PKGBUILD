# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-gitlab-registry-usage-rest"
pkgver="0.3.2"
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
sha256sums=("c15f7e061006bca1e71b3a073ba5b31404fe479f448d9bf744bae1869e30d291")

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
