# Maintainer: André Vitor L. Matos <andre.vmatos@gmail.com>

pkgname=kdeplasma-applets-playbar2
_name=PlayBar2
pkgver=2.1
pkgrel=1
pkgdesc="Mpris2 Client for Plasma5"
arch=('i686' 'x86_64')
url="https://github.com/audoban/PlayBar2"
license=('GPL')
depends=('plasma-framework' 'plasma-workspace' 'kdeclarative' 'kglobalaccel'
    'kconfigwidgets' 'kxmlgui' 'kwindowsystem')
makedepends=('kdoctools' 'extra-cmake-modules')
source=("https://github.com/audoban/${_name}/archive/v${pkgver}.tar.gz")
md5sums=('81770693b791d184d4bb5c525c1be6d6')

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_INSTALL_DIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
        ../${_name}-${pkgver}
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}

# vim: set ts=4 sws=4 sw=4 ai et
