# Maintainer: naraesk <david.baum@naraesk.eu>
pkgname=plasma5-runners-translator
pkgver=0.4.1
pkgrel=1
pkgdesc="Translates into any language using Google Translate"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/krunner-googletranslator?content=156498"
license=('GPL3')
groups=()
depends=('krunner')
makedepends=('cmake' 'extra-cmake-modules' 'ki18n' 'qt5-base')
optdepends=()
provides=()
conflicts=('kdeplasma-addons-runners-translator')
replaces=()
backup=()
options=()
install=()
changelog=()
source=('http://kde-look.org/CONTENT/content-files/156498-krunner_translator.zip')
noextract=()
md5sums=('ae995e6a83ca5f56e65486b06bafeb92')

prepare() {
  mkdir -p build
}

build() {
  cd build
  export QT_SELECT=5
  cmake ../ \
    -DCMAKE_INSTALL_PREFIX=`kf5-config --prefix` \
    -DQT_PLUGIN_INSTALL_DIR=`kf5-config --qt-plugins` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}