# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-gr-framework"
pkgver="1.23.3"
pkgrel="2"
pkgdesc="A universal framework for cross-platform visualization applications (Python bindings)."
arch=("any")
url="https://gr-framework.org"
license=("MIT")
depends=("gr-framework" "python" "python-numpy")
makedepends=("python-setuptools")
source=("https://github.com/sciapp/python-gr/releases/download/v${pkgver}/gr-${pkgver}.tar.gz")
sha256sums=("c8fd5024dbfba34ff4376aad6851f63628340b3f699a441c74d349d84befb16c")

build() {
    cd "${srcdir}/gr-${pkgver}" || return
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/gr-${pkgver}" || return
    python -m installer --destdir="$pkgdir" dist/*.whl
}
