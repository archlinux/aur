
# Maintainer: Your Name <admin@matsyos.ml>
pkgname=qt-plugins
pkgver=1.1
pkgrel=1
pkgdesc="qt-plugins of Matsya Ui."
arch=('x86_64')
url="https://github.com/MatsyaOs/qt-plugins"
license=('GPL')
groups=('Matsya')
makedepends=('gcc' 'extra-cmake-modules' 'qt6-base' 'qt6-tools' 'qt6-wayland' 'libqtxdg' 'libxcb')
depends=( 'kwindowsystem'  'libdbusmenu-lxqt'  'libqtxdg'  'qt6-declarative')
source=('git'+'https://github.com/MatsyaOs/qt-plugins')
md5sums=('SKIP')


build() {

	cd "$srcdir"/qt-plugins/

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd qt-plugins
  DESTDIR="$pkgdir" make install
}
