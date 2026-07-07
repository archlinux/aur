# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=2.0.14
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('cmake' 'qt6-multimedia' 'hicolor-icon-theme' 'yaml-cpp' 'taglib' 'libmpdclient')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/8af8a8d78979b1110c1bf0b81026508345825e9a.zip")
sha256sums=('f0de9c6ab063b704fd28a5340e239a1ba5d452c28b595c7cfc158dd9ca52c5de')

build() {
    cd mpz-8af8a8d78979b1110c1bf0b81026508345825e9a

    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_SYSTEM_TAGLIB=ON -DUSE_SYSTEM_YAMLCPP=ON ..
    cmake --build .
}

package() {
    cd mpz-8af8a8d78979b1110c1bf0b81026508345825e9a

    cd build
    DESTDIR="$pkgdir" cmake --install .
}
