# Maintainer: Anthony Vital <anthony.vital@gmail.com>
# Contributor: Erica Clawson <blargle.ragequit@gmail.com>
# Contributor: Andrew Chen <andrew.chuanye.chen@gmail.com>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=plasma5-applets-gmailfeed
_pkgname=gmailfeed
pkgver=1.2
pkgrel=2
pkgdesc="A Plasma 5 plasmoid showing your Gmail feed."
arch=('i686' 'x86_64')
url="https://github.com/anthon38/gmailfeed"
license=('GPL3')
replaces=('kdeplasma-applets-gmailfeed')
depends=('plasma-framework5' 'hicolor-icon-theme' 'knotifications5' 'qt5-xmlpatterns' 'kaccounts-integration')
makedepends=('extra-cmake-modules' 'intltool')
install=${pkgname}.install
source=('https://github.com/anthon38/gmailfeed/archive/v1.2.tar.gz')
md5sums=('271f8f6b308a5130bdaa475b0cac4bee')

build() {
  cd "${_pkgname}-${pkgver}"

  mkdir build
  cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd "${_pkgname}-${pkgver}"/build

  make DESTDIR="${pkgdir}" install
}
