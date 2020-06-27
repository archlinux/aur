# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="python-gitlab-registry-usage"
pkgver="0.2.8"
pkgrel="2"
pkgdesc="A package for querying the size of repositories in a GitLab registry."
arch=("any")
url="https://github.com/sciapp/gitlab-registry-usage"
license=("MIT")
depends=("python" "python-pyopenssl" "python-requests" "python-yacl")
makedepends=("python-setuptools")
source=("https://github.com/sciapp/gitlab-registry-usage/archive/v${pkgver}.tar.gz")
sha256sums=("2b3505e6138e5771935091b5d38da54ffa26ab28403060f22359a449736e838c")

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
