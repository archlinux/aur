# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-gitlab-multi-group-runner"
pkgver="0.1.2"
pkgrel="1"
pkgdesc="A helper to assign a GitLab runner to multiple groups and projects."
arch=("any")
url="https://github.com/sciapp/gitlab-multi-group-runner"
license=("MIT")
depends=("python" "python-cerberus" "python-gitlab" "python-pygments"
         "python-yacl" "python-yaml")
makedepends=("python-setuptools")
source=("https://github.com/sciapp/gitlab-multi-group-runner/archive/v${pkgver}.tar.gz")
sha256sums=("7dbd9b0079ceb9d25a4d9729fdb1acb39a9dc247f51e3fd17acf5c0e5ad624c7")

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
