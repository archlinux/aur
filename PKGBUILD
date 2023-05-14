# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-secure
_pypiname=secure
pkgver=0.3.0
pkgrel=3
pkgdesc="secure.py is a lightweight package that adds optional security headers for Python web frameworks."
url="https://github.com/TypeError/secure.py/releases"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/TypeError/secure/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a9b5a61a78cd53c4b5c186579964025ff9d51ebb66bd66492f027240088e8984')

build() {
    cd "${_pypiname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pypiname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
