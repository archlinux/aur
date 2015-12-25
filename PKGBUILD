# Maintainer: shi bowen <sbw /at/ sbw.so>
pkgname=doubanfm
pkgver=r51.3c2956f
pkgrel=1
pkgdesc="Beautiful DoubanFM player based on Qt5"
arch=('x86_64' 'i686')
url="https://github.com/sbwtw/DoubanFM"
license=('GPL3')
depends=('gcc-libs' 'qt5-base' 'qt5-multimedia')
makedepends=('git')
conflicts=('DoubanFM')
provides=('DoubanFM')
install=${pkgname}.install
source=('git+https://github.com/sbwtw/DoubanFM.git')
md5sums=('SKIP')

_dirname=DoubanFM

pkgver() {
    cd ${srcdir}/${_dirname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/${_dirname}/src
    qmake-qt5
    make
}

package() {
    cd ${srcdir}/${_dirname}/src

    make INSTALL_ROOT="${pkgdir}" install
}
