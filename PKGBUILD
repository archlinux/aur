# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=gnome-todo
pkgver=3.18.0
pkgrel=2
pkgdesc='a personal task manager for GNOME'
arch=('i686' 'x86_64')
url='https://wiki.gnome.org/Apps/ToDo'
license=('GPL3')
depends=('evolution-data-server')
makedepends=('intltool' 'gnome-common' 'appstream-glib')
install='gnome-todo.install'
source=("https://git.gnome.org/browse/${pkgname}/snapshot/GNOME_TODO_$(echo ${pkgver}|sed 's|\.|_|g').tar.xz")
sha256sums=('6e0dd4241f66273bb1a16c8d6a41373ab78ebaafbd5d30f4ed589c4670dbb89e')

build() {
  cd "$srcdir/GNOME_TODO_$(echo ${pkgver}|sed 's|\.|_|g')"
  ./autogen.sh --prefix=/usr --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/GNOME_TODO_$(echo ${pkgver}|sed 's|\.|_|g')"
  make DESTDIR="${pkgdir}" install
}
