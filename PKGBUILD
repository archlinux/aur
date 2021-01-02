# Maintainer: Moritz Poldrack <moritz at poldrack dot dev>
pkgname=nyuu-bin
_pkgname=nyuu
pkgver=0.4.0
pkgrel=1
pkgdesc='Flexible usenet binary posting tool'
arch=('x86_64')
url='https://github.com/animetosho/Nyuu'
license=('Public Domain')
depends=()
provides=('nyuu')
source=("${_pkgname}-${pkgver}.tar.xz::https://github.com/animetosho/Nyuu/releases/download/v${pkgver}/nyuu-v${pkgver}-linux-amd64.tar.xz")
sha256sums=('d3350e5cbfe351019531c39c9f529b8732c542bac1f185b8ecf6d28d18985822')

build() {
    rm -rf "${srcdir}"
    mkdir -p "${srcdir}"
    bsdtar -xf "../${_pkgname}-${pkgver}.tar.xz" -C "${srcdir}"
}

package() {
    mkdir -p "${pkgdir}/usr/bin" \
             "${pkgdir}/opt/nyuu"
    cp ${srcdir}/nyuu               ${pkgdir}/usr/bin/
    cp ${srcdir}/config-sample.json ${pkgdir}/opt/nyuu/
}

