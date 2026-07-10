# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=2.0.15
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('cmake' 'qt6-multimedia' 'qt6-svg' 'hicolor-icon-theme' 'yaml-cpp' 'taglib' 'libmpdclient')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/89b5a056e9beb93fd6e37948f7f4cb9a7ff1a996.zip")
sha256sums=('7d4c675b339c8e431a8f45d1575aed4468a8f60ed1a0b3463d573b36bf5444de')

build() {
    cd mpz-89b5a056e9beb93fd6e37948f7f4cb9a7ff1a996

    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_SYSTEM_TAGLIB=ON -DUSE_SYSTEM_YAMLCPP=ON ..
    cmake --build .
}

package() {
    cd mpz-89b5a056e9beb93fd6e37948f7f4cb9a7ff1a996

    cd build
    DESTDIR="$pkgdir" cmake --install .
}
