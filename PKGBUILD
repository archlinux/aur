# Maintainer: Jonas Gunz <arch at jonasgunz dot de>

_pkgname=octodns-powerdns
pkgname="python-${_pkgname}"
pkgver=0.0.5
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
sha256sums=('7b8cf8135eaf8f70c4843c9c05a5d75c0fb34e7e7ac4d978a212f480c3bb037a')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
