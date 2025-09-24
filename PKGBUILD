# Maintainer: Jonas Gunz <arch at jonasgunz dot de>

_pkgname=octodns-powerdns
pkgname="python-${_pkgname}"
pkgver=1.0.0
pkgrel=1
pkgdesc="PowerDNS API provider for octoDNS"
arch=('any')
url="https://github.com/octodns/${_pkgname}"
license=('MIT')
makedepends=(
    'python-setuptools'
)
depends=(
    'python'
    'python-octodns'
    'python-requests'
)

source=("https://github.com/octodns/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('123363681b304f593dabbd4a807d94e6c13e8ce0cf98c7bae7ef998aa73741fe')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
