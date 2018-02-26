# $Id$
# Maintainer: Abuzer Rafey <arafey@vyvygen.org>
# Contributor: Jacqueline Outka <joutka@vyvygen.org>
pkgname="mkdocs-material"
pkgver=2.6.6
pkgrel=1
pkgdesc="Material design theme for MkDocs"
arch=("any")
url="http://squidfunk.github.io/mkdocs-material/"
license=("MIT")
depends=("mkdocs" "python-pygments" "pymdown-extensions")
makedepends=("python-setuptools")
source=("git+https://github.com/squidfunk/mkdocs-material.git")

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | cut -d-  -f1
}

build() {
    cd "${srcdir}/${pkgname}"
    git checkout ${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="${pkgdir}"
}
sha256sums=('SKIP')
