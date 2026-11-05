# Maintainer: Dmitriy Q atsip-help <at> yandex <dot> ru

pkgname=python-contact
_name=${pkgname#python-}
pkgver=1.7.4
pkgrel=1
arch=('any')
license=('GPLv3')
pkgdesc="A Console UI for Meshtastic"
url="https://github.com/pdxlocations/contact"
depends=('python>=3.10' 'meshtastic-python' 'python-pyserial')
makedepends=('python-build' 'python-installer' 'python-wheel' 'git' 'python-virtualenv' 'python-poetry' 'python-poetry-core')
source=("${url}/releases/download/${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('275abd83c7aae13111dc54a68be5027848f81e600440acacb519362b3ebbbad1')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
