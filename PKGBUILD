# Maintainer:  Drommer <sergey.starovoytov.94@gmail.com>

_gitcommit=da2706640f457f89de6c26312e391b244ff550b4
pkgname=breath-gtk-theme
pkgver=5.9.0
pkgrel=1
pkgdesc="Breath GTK theme"
arch=(x86_64)
url="https://gitlab.manjaro.org/artwork/themes/breath-gtk"
license=('LGPL')
makedepends=('extra-cmake-modules')
source=("$url/-/archive/$_gitcommit.tar.gz")
sha256sums=('3d2b5e297049092976a484d354e1433dd0b4be421c6c0165c37b5c363b9bff00')

prepare() {
  mkdir -p $srcdir/breath-gtk-$_gitcommit/build
}

build() {
  cd $srcdir/breath-gtk-$_gitcommit/build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd $srcdir/breath-gtk-$_gitcommit/build
  make DESTDIR="${pkgdir}" install
}
