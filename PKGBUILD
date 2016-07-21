# Maintainer: Lukas Böger <dev___AT___lboeger___DOT___de>

pkgname=alberta
pkgver=3.0.1
pkgrel=1

pkgdesc='An adaptive hierarchical finite element toolbox'
arch=('i686' 'x86_64')

url='http://www.alberta-fem.de'
license=('GPL2' 'GPL3')

depends=('libtool' 'bash')

source=("http://www.mathematik.uni-stuttgart.de/fak8/ians/lehrstuhl/nmh/downloads/alberta/${pkgname}-${pkgver}.tar.gz")

md5sums=('8211248c997fe4fe501f0831231e65f4')

build() {
    cd "${pkgname}-${pkgver}"

    # for usage within DUNE, add --disable-fem-toolbox to speed up compilation
    ./configure --prefix=/usr --libexecdir=/usr/lib \
        --disable-graphics --disable-dependency-tracking --disable-debug

    make
}

package() {
    cd "${pkgname}-${pkgver}"

    make install DESTDIR="${pkgdir}"
}
