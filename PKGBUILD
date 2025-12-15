# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=2.0.1
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('cmake' 'qt6-multimedia' 'hicolor-icon-theme' 'yaml-cpp' 'taglib' 'libmpdclient')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/620feb7415409cee0a23c76cae4f4262319cfbe0.zip")
sha256sums=('245e1e4e4c39f584f80ab09c2a04e410f60d18c0f2e961562989404430059174')

build() {
    cd mpz-620feb7415409cee0a23c76cae4f4262319cfbe0

    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_SYSTEM_TAGLIB=ON -DUSE_SYSTEM_YAMLCPP=ON ..
    cmake --build .
}

package() {
    cd mpz-620feb7415409cee0a23c76cae4f4262319cfbe0

    cd build
    DESTDIR="$pkgdir" cmake --install .
}
