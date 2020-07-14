# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="python-gr-framework"
pkgver="1.15.2"
pkgrel="1"
pkgdesc="A universal framework for cross-platform visualization applications (Python bindings)."
arch=("any")
url="https://gr-framework.org"
license=("MIT")
depends=("gr-framework" "python" "python-numpy")
makedepends=("python-setuptools")
source=("https://github.com/sciapp/python-gr/releases/download/v${pkgver}/gr-${pkgver}.tar.gz")
sha256sums=("3b5696eb5030df0ea0f4a749d6a0cfe4ca905643a84f4d3bc4f5f6f82c7a23a0")

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
