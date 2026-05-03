pkgname=qt-notes
pkgver=0.1.0
pkgrel=1
pkgdesc='Qt 6 desktop sticky notes application with per-note encryption'
arch=('x86_64')
url='https://github.com/jswysnemc/qt-notes'
license=('MIT')
depends=('qt6-base' 'libsodium' 'libsecret')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2eed2100c8710732ffa4527573037590de6d57cd53a20f91b758786fc52378a1')

build() {
    cmake -S "${pkgname}-${pkgver}" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
