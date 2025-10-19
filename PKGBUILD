# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz-qt5
pkgver=1.1.3
pkgrel=1
pkgdesc='Music player for the large local collections (Qt5 version)'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('cmake' 'qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme' 'yaml-cpp' 'taglib')
provides=('mpz')
conflicts=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/5ff9cd6537ff17a3b047013306e17547bd9978a4.zip")
sha256sums=('0ac050c3e92c46a6656ca1d1764aafff915f5e8d849d6164a7a8cfae5364fe49')

build() {
    cd mpz-5ff9cd6537ff17a3b047013306e17547bd9978a4

    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_SYSTEM_TAGLIB=ON -DUSE_SYSTEM_YAMLCPP=ON -DUSE_QT5=ON ..
    cmake --build .
}

package() {
    cd mpz-5ff9cd6537ff17a3b047013306e17547bd9978a4

    cd build
    DESTDIR="$pkgdir" cmake --install .
}
