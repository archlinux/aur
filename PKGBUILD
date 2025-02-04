# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=python-ctrader-openapi
pkgver=0.9.3_rc0
pkgrel=1
pkgdesc="A Python package for interacting with cTrader Open API"
arch=('any')
url="https://github.com/spotware/OpenApiPy"
license=('MIT')
depends=('python-twisted' 'python-pyopenssl' 'python-protobuf' 'python-requests' 'python-inputimeout')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("${pkgname}-${pkgver//_/-}.tar.gz"::"${url}/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=('8154d81af812d0b4c3fac7934108dda8eec90fed132515d7ca0184ab20850ad5')
_name="$(basename ${url})"

build() {
    cd "${_name}-${pkgver//_/-}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver//_/-}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
# vim:set ts=4 sw=4 et:
