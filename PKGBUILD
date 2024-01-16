# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=kapow
pkgver=1.6.2
pkgrel=1
pkgdesc='Punch clock to track time spent on projects'
arch=('x86_64')
url="https://gottcode.org/${pkgname}/"
license=('GPL3')
depends=('qt6-base')
makedepends=('cmake' 'qt6-tools')
source=("https://gottcode.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('aaeb1fe4f4fc671a7c3180757f9aa53f8466588ccce106eda84eba8c69adbf02')

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
