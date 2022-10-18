# Maintainer: Jonas Gunz <arch at jonasgunz dot de>

pkgname=python-octodns
_pkgname=octodns
pkgver=0.9.20
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
md5sums=('5befac715974ff2db851cdec29d111d8')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
