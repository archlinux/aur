# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-gitlab-multi-group-runner"
pkgver="0.1.0"
pkgrel="1"
pkgdesc="A helper to assign a GitLab runner to multiple groups and projects."
arch=("any")
url="https://github.com/sciapp/gitlab-multi-group-runner"
license=("MIT")
depends=("python" "python-cerberus" "python-gitlab" "python-pygments"
         "python-yacl" "python-yaml")
makedepends=("python-setuptools")
source=("https://github.com/sciapp/gitlab-multi-group-runner/archive/v${pkgver}.tar.gz")
sha256sums=("14f210eb4d0481176900cbc71620d5d142e0251a68b67ec7f9ad3eb7303c67cc")

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
