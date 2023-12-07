# Maintainer: Jonas Gunz <arch at jonasgunz dot de>

_pkgname=octodns-bind
pkgname="python-${_pkgname}"
pkgver=0.0.5
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
sha256sums=('0f42e478c7fbcf333001179e47cbf93f65d5b42d58344ccfa0ca529f2768b94d')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
