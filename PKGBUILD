# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-gr-framework"
pkgver="1.27.0"
pkgrel="1"
pkgdesc="A universal framework for cross-platform visualization applications (Python bindings)."
arch=("any")
url="https://gr-framework.org"
license=("MIT")
depends=("gr-framework" "python" "python-numpy")
makedepends=("python-setuptools" "python-vcversioner")
source=("https://github.com/sciapp/python-gr/releases/download/v${pkgver}/gr-${pkgver}.tar.gz")
sha256sums=("2c3d0a31b318f0e480e8400f44af05bc0bbda039f59ac90df9de6308fe5c881b")

build() {
    cd "${srcdir}/gr-${pkgver}" || return
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/gr-${pkgver}" || return
    python -m installer --destdir="$pkgdir" dist/*.whl
}
