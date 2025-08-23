# Maintainer: Network Jack <Network_Jack@null.net>

pkgname=python-generate_mac
_pypiname=python-generate_mac
pkgver=1.3.1
pkgrel=4
pkgdesc="Python Library for Generating Ethernet MAC addresses"
url="https://github.com/NetworkJack2/python-generate_mac"
arch=('any')
license=('GPLv3')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=(${_pypiname}-${pkgver}.tar.gz::https://github.com/GIJack/python-generate_mac/archive/${pkgver}.tar.gz)
sha256sums=('bbe887839bd366b263376a87f40a55523092a9090124c3d5637dc144f9ca51be')

build() {
    cd "${_pypiname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pypiname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
