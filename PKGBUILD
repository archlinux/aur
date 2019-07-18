# Maintainer: John_Smith <sherlockarrow@gmail.com>
pkgname=graywolf
pkgver=0.1.6
pkgrel=1
epoch=
pkgdesc='An oopensource placement tool'
arch=('i686' 'x86_64')
url='https://github.com/rubund/graywolf/'
license=('GPL')
provides=('libycadgraywolf.so')
depends=('bash' 'libx11')
makedepends=('cmake' 'gsl')
source=("https://github.com/rubund/${pkgname}/archive/${pkgver}.zip")
sha512sums=('896665580c822c7b505e06e443a4b5e6e14c4061fee9addef87ffbd93cdf9841ba1d770f843d98e4fdd210bf61df4496dbc6b3ae7b8834ae3d564a8e5f72403a')
options=('!makeflags')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
