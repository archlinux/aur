# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-gr-framework"
pkgver="1.18.0"
pkgrel="1"
pkgdesc="A universal framework for cross-platform visualization applications (Python bindings)."
arch=("any")
url="https://gr-framework.org"
license=("MIT")
depends=("gr-framework" "python" "python-numpy")
makedepends=("python-setuptools")
source=("https://github.com/sciapp/python-gr/releases/download/v${pkgver}/gr-${pkgver}.tar.gz")
sha256sums=("11fb32f6cfabcfa3b4110c8f42af322ef3d5e237fff80e4f081b923e633ffda6")

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
