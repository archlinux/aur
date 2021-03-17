# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-gitlab-registry-usage"
pkgver="0.3.2"
pkgrel="1"
pkgdesc="A package for querying the size of repositories in a GitLab registry."
arch=("any")
url="https://github.com/sciapp/gitlab-registry-usage"
license=("MIT")
depends=("python" "python-pyopenssl" "python-requests" "python-yacl")
makedepends=("python-setuptools")
source=("https://github.com/sciapp/gitlab-registry-usage/archive/v${pkgver}.tar.gz")
sha256sums=("e8f4023bc2cf89f604513e120428aacd251e6a8538186e49611097c353a03c7f")

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
