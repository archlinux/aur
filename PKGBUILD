# Maintainer: Berbigou <ber.bigou@yahoo.fr>

pkgname=qtvkbd
pkgver=0.8.3
pkgrel=1
pkgdesc="A virtual keyboard"
arch=(i686 x86_64)
url="https://github.com/Alexander-r/qtvkbd"
license=('GPL3')
depends=('qt5-base' 'qt5-x11extras' 'libxtst')
makedepends=('cmake')
source=("https://github.com/Alexander-r/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('612cf920f4d287cbd4fdca7d1aa78c09')
sha256sums=('d6a53280e8fdceaae3f1dcaa2780aaa98062761a8e1b3e2589e09d186a93cfd8')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DDATA_INSTALL_DIR=/usr/share/apps \
    -DQT_QMAKE_EXECUTABLE=qmake-qt5 \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
