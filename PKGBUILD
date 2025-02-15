# Maintainer: Sujal Vijayaraghavan <email at sujal dot tv>


pkgname=matlock
pkgver=1.0.0
pkgrel=0
pkgdesc='Screen lock program for X like The Matrix'
arch=('x86_64' 'aarch64')
url="https://gitlab.sujal.tv/tvsujal/${pkgname}"
licence=('MIT/X Consortium Licence')
makedepends=('git')
depends=('libxext' 'libxrandr')
source=("http://gitlab.sujal.tv/tvsujal/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar")
sha256sums=('f52883049bde0c743c06c74e55d7f5250cd3f1a69b39bd10bb951359991b05a4')


build() {
    rm -rf $pkgname
    tar xf $pkgname-${pkgver}.tar --one-top-level=$pkgname --strip-components=1
    cd $pkgname
    make
}


package() {
    cd $pkgname
    make install
    install -m 644 -D LICENCE "/usr/local/share/${pkgname}/LICENCE"
}
