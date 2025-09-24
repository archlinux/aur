# Maintainer: Jonas Gunz <arch at jonasgunz dot de>

_pkgname=octodns-bind
pkgname="python-${_pkgname}"
pkgver=1.0.1
pkgrel=1
pkgdesc="RFC compliant (Bind9) provider for octoDNS"
arch=('any')
url="https://github.com/octodns/${_pkgname}"
license=('MIT')
makedepends=(
    'python-setuptools'
)
depends=(
    'python'
    'python-octodns'
    'python-dnspython'
)

source=("https://github.com/octodns/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('16b632e14dec8b37f87220b1740814580d555ab030a7ec05ae519ff2e80ae6aa')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
