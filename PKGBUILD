# Maintainer: Matthias De Bie <mattydebie@gmail.com>

pkgname="kemai"
pkgdesc="A QT5 client for kimai2"
pkgver="0.5.0"
pkgrel=1
url="https://github.com/AlexandrePTJ/kemai"
arch=('i686' 'x86_64')
license=('MIT')
source=("https://github.com/AlexandrePTJ/kemai/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c224f91e2e25ec9fd2bed18d5e5d63f988c36fb9f05b02992ffb4bb61b877f87')
makedepends=("cmake")
depends=("qt5-base")

build() {
  cd kemai-${pkgver}
  cmake . -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build --config Release
}

package() {
  mkdir ${pkgdir}/usr/bin -p
  mkdir ${pkgdir}/usr/share/applications -p
  cp -f kemai-${pkgver}/build/src/app/Kemai ${pkgdir}/usr/bin/
  cp -f kemai-${pkgver}/bundle/linux/kemai.desktop ${pkgdir}/usr/share/applications/
}
