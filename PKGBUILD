# Maintainer: M0Rf30

pkgname=gnome-pie-git
pkgver=316.6d9b7ba
pkgrel=1
pkgdesc="A visual application launcher for gnome."
arch=('i686' 'x86_64')
url="https://github.com/Simmesimme/Gnome-Pie"
license=('GPL')
depends=('gtk3' 'libunique3' 'gnome-menus' 'cairo' 'libgee' 'libxml2' 'libxtst' 'libunique' 'gdk-pixbuf2' 'hicolor-icon-theme' 'bamf')
makedepends=('vala' 'cmake' 'git')
install='gnome-pie-git.install'
source=('gnome-pie::git://github.com/Simmesimme/Gnome-Pie.git')


build() {
  cd gnome-pie
  msg "Building gnome-pie"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd gnome-pie/build
  make DESTDIR=${pkgdir} install
}

pkgver() {
  cd gnome-pie
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
