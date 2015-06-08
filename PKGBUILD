# Contributor: Giuseppe Calà <jiveaxe@gmail.com>

pkgname=kdeplasma-applets-steamcompanion
pkgver=0.5.4
pkgrel=1
pkgdesc="A plasmoid to track Steam's specials and deals."
arch=('i686' 'x86_64')
url=(http://kde-apps.org/content/show.php/Steam+Companion?content=141713)
license=('GPL')
depends=('kdebase-workspace')
makedepends=('automoc4' 'cmake')
source=('http://opendesktop.org/CONTENT/content-files/141713-steamcompanion.tar.gz')
md5sums=('8356e0a5f9fbe4a7bdf5e8340687b309')
replaces=('steamcompanion')
provides=('steamcompanion')

build() {
  cd ${srcdir}/steamcompanion

  mkdir build
  cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` || return 1
  make || return 1
}

package() {
  cd ${srcdir}/steamcompanion/build

  make DESTDIR=$pkgdir install || return 1
}
