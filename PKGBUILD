# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-secure
_pypiname=secure
pkgver=1.0.0
pkgrel=1
pkgdesc="secure.py is a lightweight package that adds optional security headers for Python web frameworks."
url="https://github.com/TypeError/secure.py/releases"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/TypeError/secure/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a1a211f73d3ea4212396b77654ee772e69153ad97c51e7e73c09b28898bc9252')

build() {
    cd "${_pypiname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pypiname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
