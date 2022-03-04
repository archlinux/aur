# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-gr-framework"
pkgver="1.19.1"
pkgrel="1"
pkgdesc="A universal framework for cross-platform visualization applications (Python bindings)."
arch=("any")
url="https://gr-framework.org"
license=("MIT")
depends=("gr-framework" "python" "python-numpy")
makedepends=("python-setuptools")
source=("https://github.com/sciapp/python-gr/releases/download/v${pkgver}/gr-${pkgver}.tar.gz")
sha256sums=("d70e1a3495cd5bf7b758c0a092e2a2ab23806965565dd7f87da664828082efe9")

build() {
    cd "${srcdir}/gr-${pkgver}" || return
    python setup.py build
}

package() {
    cd "${srcdir}/gr-${pkgver}" || return
    python setup.py install --optimize=1 \
                            --prefix=/usr \
                            --root="${pkgdir}" \
                            --skip-build
}
