# Maintainer: Jonas Gunz <arch at jonasgunz dot de>

_pkgname=octodns-powerdns
pkgname="python-${_pkgname}"
pkgver=0.0.6
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
sha256sums=('2bb92c0d4123a01683373755a35bdf6d3afc6e65ccf425aa3cd64c15cdb27745')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
