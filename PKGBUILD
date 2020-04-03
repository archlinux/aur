# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=fprime
pkgver=1.3.1
pkgrel=1
pkgdesc="A Flight-Proven, Multi-Platform, Open-Source Flight Software Framework"
arch=('i686' 'x86_64')
url="https://github.com/nasa/fprime"
license=('Apache-2.0')
depends=('gcc' 'python')
optdepends=()
makedepends=('cmake' 'python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/nasa/${pkgname}/archive/NASA-v${pkgver}.tar.gz")
sha256sums=('345eed5b124799992f425e3eb5c831c3fa8a4af1336b3ae03ea929d23eb9c690')

_pkgname="fprime-NASA"
_pkgver="v${pkgver}"

build() {
    cd "${srcdir}/${_pkgname}-${_pkgver}/Fw/Python"
    python setup.py build

    cd "${srcdir}/${_pkgname}-${_pkgver}/Gds"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${_pkgver}/Fw/Python"
    python setup.py install --root="$pkgdir"/ --optimize=1

    cd "${srcdir}/${_pkgname}-${_pkgver}/Gds"
    python setup.py install --root="$pkgdir"/ --optimize=1
}
