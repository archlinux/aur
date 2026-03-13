# Maintainer: Dmitriy Q atsip-help <at> yandex <dot> ru

pkgname=python-contact
_name=${pkgname#python-}
pkgver=1.4.22
pkgrel=1
arch=('any')
license=('GPLv3')
pkgdesc="A Console UI for Meshtastic"
url="https://github.com/pdxlocations/contact"
depends=('python>=3.10' 'meshtastic-python' 'python-pyserial')
makedepends=('python-build' 'python-installer' 'python-wheel' 'git' 'python-virtualenv' 'python-poetry' 'python-poetry-core')
source=("https://github.com/pdxlocations/${_name}/releases/download/${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('8ce23bdf2553473952cd8159baaafdb99c6ad68915680f63300aa39a3f48c335')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
