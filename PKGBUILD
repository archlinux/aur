# Maintainer: Dmitriy Q atsip-help <at> yandex <dot> ru

pkgname=python-contact
_name=${pkgname#python-}
pkgver=1.7.2
pkgrel=1
arch=('any')
license=('GPLv3')
pkgdesc="A Console UI for Meshtastic"
url="https://github.com/pdxlocations/contact"
depends=('python>=3.10' 'meshtastic-python' 'python-pyserial')
makedepends=('python-build' 'python-installer' 'python-wheel' 'git' 'python-virtualenv' 'python-poetry' 'python-poetry-core')
source=("${url}/releases/download/${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('dde51046e778fe9c61b590cd840a532184f72477f9b8e0bb764516d79f421e6d')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
