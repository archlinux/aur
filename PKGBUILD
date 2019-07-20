# Maintainer: John Smith <sherlockarrow@gmail.com>
pkgname=qflow
pkgver=1.3.16
pkgrel=1
epoch=
pkgdesc='OSU 0.35um open-source standard cell set'
arch=('i686' 'x86_64')
url='http://opencircuitdesign.com/qflow/'
license=('GPL')
depends=('magic' 'qrouter' 'tcsh' 'yosys')
optdepends=('graywolf: Placement support')
source=("${url}archive/${pkgname}-${pkgver}.tgz")
sha512sums=('9776a956c49f92623b21e6668556f5087c0aec1b534c7f4944a08d89b88988475ca9d8af5b857d2636f7a98e1c77bf9b2bc76a03003357f0ddf8d984944821ee'  )

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --with-bindir=/usr/bin \
        --with-libdir=/usr/share/${pkgname}
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
