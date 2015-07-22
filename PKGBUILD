# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=gnome-todo
pkgver=3.17.4
pkgrel=1
pkgdesc='a personal task manager for GNOME'
arch=('i686' 'x86_64')
url='https://feaneron.wordpress.com/2015/06/22/introducing-gnome-to-do/'
license=('GPL3')
depends=('evolution-data-server>=3.17.1' 'pango' 'gtk3' 'glib2')
makedepends=('intltool' 'gnome-common')
install='gnome-todo.install'
source=("https://git.gnome.org/browse/${pkgname}/snapshot/GNOME_TODO_$(echo ${pkgver}|sed 's|\.|_|g').tar.xz")
sha256sums=('dd3bdbdac37d5d818c58740281c4eb8897279ffdead7a4fd20669c5b65e097df')

build() {
  cd "$srcdir/GNOME_TODO_$(echo ${pkgver}|sed 's|\.|_|g')"
  ./autogen.sh --prefix=/usr --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/GNOME_TODO_$(echo ${pkgver}|sed 's|\.|_|g')"
  make DESTDIR="${pkgdir}" install
}
