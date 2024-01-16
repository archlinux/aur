# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=connectagram
pkgver=1.3.5
pkgrel=1
pkgdesc='Word unscrambling game'
arch=('x86_64')
url="https://gottcode.org/${pkgname}/"
license=('GPL3')
depends=('qt6-base')
makedepends=('cmake' 'qt6-tools')
source=("https://gottcode.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('313598200733fd5c8080eb176d58cae407818825e7746030d4af00b3613ee454')

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
