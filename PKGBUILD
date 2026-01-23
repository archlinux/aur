# Maintainer: Dmitriy Q atsip-help <at> yandex <dot> ru

pkgname=python-contact
_name=${pkgname#python-}
pkgver=1.4.7
pkgrel=7
arch=('any')
license=('GPLv3')
pkgdesc="A Console UI for Meshtastic"
url="https://github.com/pdxlocations/contact"
depends=('python>=3.10' 'python-meshtastic' 'python-pyserial')
makedepends=('python-build' 'python-installer' 'python-wheel' 'git' 'python-virtualenv' 'python-poetry' 'python-poetry-core')
source=("https://github.com/pdxlocations/${_name}/releases/download/${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('8b1ce72ead7cca551537824a2262ca1ea8984bdb65944b94814f6faf6c80e1bb')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
