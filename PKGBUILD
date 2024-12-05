# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-gr-framework"
pkgver="1.25.0"
pkgrel="1"
pkgdesc="A universal framework for cross-platform visualization applications (Python bindings)."
arch=("any")
url="https://gr-framework.org"
license=("MIT")
depends=("gr-framework" "python" "python-numpy")
makedepends=("python-setuptools" "python-vcversioner")
source=("https://github.com/sciapp/python-gr/releases/download/v${pkgver}/gr-${pkgver}.tar.gz")
sha256sums=("714b01950b7fad5f8927e1c6cecf0d3e87a8f58a7e8ef9180a2464e2e9728111")

build() {
    cd "${srcdir}/gr-${pkgver}" || return
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/gr-${pkgver}" || return
    python -m installer --destdir="$pkgdir" dist/*.whl
}
