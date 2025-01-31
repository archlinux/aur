# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz-qt5
pkgver=1.1.1
pkgrel=0
pkgdesc='Music player for the large local collections (Qt5 version)'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('cmake' 'qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme' 'yaml-cpp' 'taglib')
provides=('mpz')
conflicts=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/8e975cd01a9a0bbe99147db78e745c0411651d3f.zip")
sha256sums=('87a8f29c9ad12ca13a79de4d3e6a5ff2d669f3b93c020c18f2394751a806a72f')

build() {
    cd mpz-8e975cd01a9a0bbe99147db78e745c0411651d3f

    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_SYSTEM_TAGLIB=ON -DUSE_SYSTEM_YAMLCPP=ON -DUSE_QT5=ON ..
    cmake --build .
}

package() {
    cd mpz-8e975cd01a9a0bbe99147db78e745c0411651d3f

    cd build
    DESTDIR="$pkgdir" cmake --install .
}
