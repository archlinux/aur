# Maintainer: Dmitriy Q atsip-help <at> yandex <dot> ru

pkgname=python-contact
_name=${pkgname#python-}
pkgver=1.4.13
pkgrel=1
arch=('any')
license=('GPLv3')
pkgdesc="A Console UI for Meshtastic"
url="https://github.com/pdxlocations/contact"
depends=('python>=3.10' 'python-meshtastic' 'python-pyserial')
makedepends=('python-build' 'python-installer' 'python-wheel' 'git' 'python-virtualenv' 'python-poetry' 'python-poetry-core')
source=("https://github.com/pdxlocations/${_name}/releases/download/${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('784185c474897334b032029804a5cfcc26503739dcbe5941e3f2d7f19a89ae8b')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
