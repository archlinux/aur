# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.1.0
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('cmake' 'qt6-multimedia' 'hicolor-icon-theme' 'yaml-cpp' 'taglib')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/f6b2a329286e7e04935677597f016b49a1abfa02.zip")
sha256sums=('0eb0c0c89d99a7bf829edd46b961254dd6904c9b4a96dfc7973be7add6b7cffc')

build() {
    cd mpz-f6b2a329286e7e04935677597f016b49a1abfa02

    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_SYSTEM_TAGLIB=ON -DUSE_SYSTEM_YAMLCPP=ON ..
    cmake --build .
}

package() {
    cd mpz-f6b2a329286e7e04935677597f016b49a1abfa02

    cd build
    DESTDIR="$pkgdir" cmake --install .
}
