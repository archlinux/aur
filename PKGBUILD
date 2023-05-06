# Maintainer: Rocket Aaron <i at rocka dot me>
# Contributor: Art Dev <artdevjs at gmail dot com>

pkgname=klassy
pkgver=4.0.breeze5.25.80
pkgrel=1
pkgdesc='Klassy is a highly customizable binary Window Decoration and Application Style plugin for recent versions of the KDE Plasma desktop. It provides the Klassy, Kite, Oxygen/Breeze, and Redmond icon styles.'
arch=('x86_64')
url="https://github.com/paulmcauley/klassy"
license=('GPL')
replaces=('classikstyles' 'classik')
depends=('frameworkintegration' 'kdecoration' 'breeze-icons' 'kwayland' 'kirigami2' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'kcmutils')
optdepends=('kcmutils: for klassy-settings')
source=("${pkgname}-${pkgver}.zip::https://github.com/paulmcauley/${pkgname}/archive/refs/tags/${pkgver}.zip")
sha256sums=('1b8e28bd358f4d8c02c5afeb3930b9dc81e6096d7f1f7e718fcf487650b729c5')

build() {
  cmake -B build -S ${pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=OFF \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
