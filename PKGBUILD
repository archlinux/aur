# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-gr-framework"
pkgver="1.23.1"
pkgrel="1"
pkgdesc="A universal framework for cross-platform visualization applications (Python bindings)."
arch=("any")
url="https://gr-framework.org"
license=("MIT")
depends=("gr-framework" "python" "python-numpy")
makedepends=("python-setuptools")
source=("https://github.com/sciapp/python-gr/releases/download/v${pkgver}/gr-${pkgver}.tar.gz")
sha256sums=("f77f320a7471fd374062e4ee7af1a0dfeb86264cf4a627177208dd276ef60699")

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
