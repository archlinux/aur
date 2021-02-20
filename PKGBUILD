# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=fprime
pkgver=1.5.3
pkgrel=1
pkgdesc="A Flight-Proven, Multi-Platform, Open-Source Flight Software Framework"
arch=('i686' 'x86_64')
url="https://github.com/nasa/fprime"
license=('Apache-2.0')
depends=('gcc' 'python')
optdepends=()
makedepends=('cmake' 'python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/nasa/${pkgname}/archive/NASA-v${pkgver}.tar.gz")
sha256sums=('f1bef25d50fd5ae586708138df755e36158d6de277b7d850822550262236433d')

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
