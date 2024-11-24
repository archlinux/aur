# Maintainer: Jonas Gunz <arch at jonasgunz dot de>

pkgname=python-octodns
_pkgname=octodns
pkgver=1.10.0
pkgrel=1
pkgdesc="Tools for managing DNS across multiple providers"
arch=('any')
url="https://github.com/octodns/octodns"
license=('MIT')
makedepends=(
    'python-setuptools'
)
depends=(
    'python'
    'python-dnspython'
    'python-yaml'
    'python-requests'
    'python-natsort'
    'python-pycountry'
    'python-pycountry-convert'
    'python-dateutil'
    'python-fqdn'
)

source=("https://github.com/octodns/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('741d2c49c5743ac037bd77f199b3fdfc5b076ef8dcc103ba89a11b667aa12703')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python -m build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl
}
