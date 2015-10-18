# Maintainer: shi bowen <sbw /at/ sbw.so>
pkgname=doubanfm
pkgver=r34.ceef4c3
pkgrel=1
pkgdesc="Beautiful DoubanFM player based on Qt5"
arch=('x86_64' 'i686')
url="https://github.com/sbwtw/doubanFM"
license=('GPL3')
depends=('gcc-libs' 'qt5-base')
makedepends=('git')
conflicts=('DoubanFM')
provides=('DoubanFM')
source=('git+https://github.com/sbwtw/doubanFM.git')
md5sums=('SKIP')

_dirname=doubanFM

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
