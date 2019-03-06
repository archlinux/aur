pkgname=krunner-translator
pkgver=1.1.1
pkgrel=1
pkgdesc="A translator plugin for krunner using glosbe and yandex."
arch=('any')
url="https://github.com/naraesk/krunner-translator"
license=('GPL')
depends=('krunner' 'qt5-base')
makedepends=('cmake' 'extra-cmake-modules')
source=("https://github.com/naraesk/krunner-translator/archive/v${pkgver}.tar.gz")
md5sums=('311ad58120cb8c6f2c4bb7cfa2316e31')

build() {
  mkdir -p build
  cd build
  cmake ../${pkgname}-${pkgver} -DCMAKE_INSTALL_PREFIX=`kf5-config --prefix` -DKDE_INSTALL_QTPLUGINDIR=`kf5-config --qt-plugins` -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make install DESTDIR="${pkgdir}"
}
 
