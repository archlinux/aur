# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-gitlab-registry-usage"
pkgver="0.3.0"
pkgrel="1"
pkgdesc="A package for querying the size of repositories in a GitLab registry."
arch=("any")
url="https://github.com/sciapp/gitlab-registry-usage"
license=("MIT")
depends=("python" "python-pyopenssl" "python-requests" "python-yacl")
makedepends=("python-setuptools")
source=("https://github.com/sciapp/gitlab-registry-usage/archive/v${pkgver}.tar.gz")
sha256sums=("c9de631e142a17039fdc7980fc1faac601a38b28b957e75e7bb940eb290be9b4")

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
