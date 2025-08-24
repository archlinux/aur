# Maintainer: Network Jack <Network_Jack@null.net>

pkgname=tor-util
pkgver=0.1.4
pkgrel=2
pkgdesc="Utility for controling TOR via the API"
url="https://github.com/NetworkJack2/tor-util"
arch=('any')
license=('GPL3')
depends=('python' 'python-stem' 'python-pyqt5')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/GIJack/tor-util/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('121d2670ac9f0ad458878903fef37f9e9a9f60f8520ae3c6bd9edc372f5f3329')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
