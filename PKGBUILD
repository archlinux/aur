# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz-qt5
pkgver=2.0.6
pkgrel=0
pkgdesc='Music player for the large local collections (Qt5 version)'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('cmake' 'qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme' 'yaml-cpp' 'taglib' 'libmpdclient')
provides=('mpz')
conflicts=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/ff449ea34dbeab93966bed68a146ed3064b3b6b7.zip")
sha256sums=('2089f583cb168651642411bd0ce7207caa2362fda455ea26f36d0484e0529c1e')

build() {
    cd mpz-ff449ea34dbeab93966bed68a146ed3064b3b6b7

    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_SYSTEM_TAGLIB=ON -DUSE_SYSTEM_YAMLCPP=ON -DUSE_QT5=ON -DUSE_SYSTEM_LIBMPDCLIENT=ON ..
    cmake --build .
}

package() {
    cd mpz-ff449ea34dbeab93966bed68a146ed3064b3b6b7

    cd build
    DESTDIR="$pkgdir" cmake --install .
}
