# Maintainer: Jonas Gunz <arch at jonasgunz dot de>

_pkgname=octodns-bind
pkgname="python-${_pkgname}"
pkgver=0.0.6
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
sha256sums=('5b7868a0768daa7cad69bc56f706cd2e6d4dbd7e9ac1b405f5bd1332ab5411e3')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
