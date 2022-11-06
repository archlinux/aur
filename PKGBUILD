# Maintainer: Jonas Gunz <arch at jonasgunz dot de>

pkgname=python-octodns
_pkgname=octodns
pkgver=0.9.21
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
md5sums=('01e81a891f5769aba18f4064f639cb6f')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
