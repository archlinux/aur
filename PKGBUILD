# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-gitlab-registry-usage"
pkgver="0.3.3"
pkgrel="1"
pkgdesc="A package for querying the size of repositories in a GitLab registry."
arch=("any")
url="https://github.com/sciapp/gitlab-registry-usage"
license=("MIT")
depends=("python" "python-pyopenssl" "python-requests" "python-yacl")
makedepends=("python-setuptools")
source=("https://github.com/sciapp/gitlab-registry-usage/archive/v${pkgver}.tar.gz")
sha256sums=("cd1468ca23efca7790d840af5f9ab2523841c861d8428440280b505ac595f722")

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
