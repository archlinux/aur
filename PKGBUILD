# Maintainer: Moritz Poldrack <moritz at poldrack dot dev>
pkgname=nyuu-bin
_pkgname=nyuu
pkgver=0.4.2
pkgrel=1
pkgdesc='Flexible usenet binary posting tool'
arch=('x86_64')
url='https://github.com/animetosho/Nyuu'
license=('Public Domain')
depends=()
provides=('nyuu')
source=("${_pkgname}-${pkgver}.tar.xz::https://github.com/animetosho/Nyuu/releases/download/v${pkgver}/nyuu-v${pkgver}-linux-amd64.tar.xz")
sha256sums=('bbea69ffaf1d8ed3465935157e3842fe7a38bade2703504879eb8bc7c0a83dff')

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
