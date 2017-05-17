# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=gscope
pkgver="2.6+3.6_7_g7378c2e"
_ghver='7378c2efd989c9f491a9d5d98fcc5a663fe1650c'
pkgrel=1
pkgdesc="Interactive source code browsing tool for C (and other languages)"
arch=('i386' 'x86_64')
url="https://github.com/tefletch/gscope"
license=('MIT')
depends=('gtk3' 'gtksourceview3')
source=("https://github.com/tefletch/${pkgname}/archive/${_ghver}.tar.gz")
sha256sums=('4776d207bfe5bc20dedee95faa36856693b88bfa873e00b34320f62f63af95e3')

prepare() {
    cd "${pkgname}-${_ghver}/packages/gscope3"

    # automake looks for a COPYING file
    cp ../../LICENSE COPYING
}

build() {
    cd "${pkgname}-${_ghver}/packages/gscope3"

    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${_ghver}/packages/gscope3"

    make DESTDIR="${pkgdir}/" install
}
