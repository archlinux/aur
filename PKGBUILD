# Maintainer: Moritz Poldrack <moritz at poldrack dot dev>
pkgname=nyuu-bin
_pkgname=nyuu
pkgver=0.3.8
pkgrel=1
pkgdesc='Flexible usenet binary posting tool'
arch=('x86_64')
url='https://github.com/animetosho/Nyuu'
license=('Public Domain')
depends=()
provides=('nyuu')
source=("${_pkgname}-${pkgver}.tar.xz::https://github.com/animetosho/Nyuu/releases/download/v${pkgver}/nyuu-v${pkgver}-linux-amd64.tar.xz")
sha256sums=('4195359cb8a66ffd207d310d39b177590f522fd8a421b1ec86f3c8c2c1a68ab0')

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

