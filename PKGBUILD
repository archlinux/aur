# Maintainer: David Baum <david.baum@naraesk.eu>
pkgname=plasma-runners-translator
pkgver=0.6.1
pkgrel=1
pkgdesc="Translates words and sentences into any language"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/krunner-googletranslator?content=156498"
license=('GPL3')
groups=()
depends=('krunner')
makedepends=('cmake' 'extra-cmake-modules' 'ki18n' 'qt5-base')
optdepends=()
provides=()
conflicts=('kdeplasma-addons-runners-translator')
replaces=(plasma5-runners-translator)
backup=()
options=()
install=()
changelog=()
source=('http://kde-apps.org/CONTENT/content-files/156498-krunner-0.6.1.zip')
noextract=()
md5sums=('e46938ae0aaa01afc86ec5585503e17b')

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
