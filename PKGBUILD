pkgname=stonks
_pkgname=stonks
pkgver="1.0.10"
_pkgver="1.0.10"
pkgrel=1
pkgdesc="Stonks is a terminal based stock visualizer and tracker that displays realtime stocks in graph format in a terminal. See how fast your stonks will crash."
arch=('any')
url="https://github.com/ericm/stonks"
license=('GPL3')
source=("${_pkgname}::git+https://github.com/ericm/stonks.git#tag=v${_pkgver}")
sha256sums=('SKIP')

makedepends=('go>=1.12' 'make' 'pkgconf')

prepare() {
    cd "${_pkgname}"
    make
}

package() {
    install -dm755 ${pkgdir}/usr/local/bin/${BINAME}
    cd "${_pkgname}"
    cp ${_pkgname} ${pkgdir}/usr/local/bin/${BINAME}
}
