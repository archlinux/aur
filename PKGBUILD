# Maintainer: Jonas Gunz <arch at jonasgunz dot de>

pkgname=python-octodns
_pkgname=octodns
pkgver=1.9.1
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
sha256sums=('d397760226892a82dea064d9cb54034867fa835c2a5328f5c470ec40d71e3b1f')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python -m build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl
}
