# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-gr-framework"
pkgver="1.24.0"
pkgrel="2"
pkgdesc="A universal framework for cross-platform visualization applications (Python bindings)."
arch=("any")
url="https://gr-framework.org"
license=("MIT")
depends=("gr-framework" "python" "python-numpy")
makedepends=("python-setuptools" "python-vcversioner")
source=("https://github.com/sciapp/python-gr/releases/download/v${pkgver}/gr-${pkgver}.tar.gz")
sha256sums=("4a2155808f700a9bef8a32d48574f8952ac4f398e1906aee72735c9b503c8df8")

build() {
    cd "${srcdir}/gr-${pkgver}" || return
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/gr-${pkgver}" || return
    python -m installer --destdir="$pkgdir" dist/*.whl
}
