# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-secure
_pypiname=secure
pkgver=1.0.1
pkgrel=1
pkgdesc="secure.py is a lightweight package that adds optional security headers for Python web frameworks."
url="https://github.com/TypeError/secure.py/releases"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/TypeError/secure/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8c998dfb5afc954a63dcc214bdb1fc2f990385e775babf346d4fc11553e2f9bc')

build() {
    cd "${_pypiname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pypiname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
