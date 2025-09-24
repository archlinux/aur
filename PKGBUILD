# Maintainer: Jonas Gunz <arch at jonasgunz dot de>

pkgname=python-octodns
_pkgname=octodns
pkgver=1.13.0
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
sha256sums=('d791efd66807de3705da671e5c1f6c8116dbdebae2704f1a9ef2410de6a93b0b')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python -m build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl
}
