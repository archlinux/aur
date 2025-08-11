# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-gr-framework"
pkgver="1.29.0"
pkgrel="1"
pkgdesc="A universal framework for cross-platform visualization applications (Python bindings)."
arch=("any")
url="https://gr-framework.org"
license=("MIT")
depends=("gr-framework" "python" "python-numpy")
makedepends=("python-build" "python-installer" "python-setuptools" "python-vcversioner" "python-wheel")
source=("https://github.com/sciapp/python-gr/releases/download/v${pkgver}/gr-${pkgver}.tar.gz")
sha256sums=("fa41ddd032dd86f3ac47c7c6ad356c3b7129ee7201975184f7b50c4421faf526")

build() {
    cd "${srcdir}/gr-${pkgver}" || return
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/gr-${pkgver}" || return
    python -m installer --destdir="$pkgdir" dist/*.whl
}
