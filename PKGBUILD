# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=gnome-todo
pkgver=3.17.3
pkgrel=1
pkgdesc='a personal task manager for GNOME'
arch=('i686' 'x86_64')
url='https://feaneron.wordpress.com/2015/06/22/introducing-gnome-to-do/'
license=('GPL3')
depends=('evolution-data-server>=3.17.1' 'pango')
makedepends=('intltool' 'gnome-common')
install='gnome-todo.install'
source=("https://git.gnome.org/browse/${pkgname}/snapshot/GNOME_TODO_$(echo ${pkgver}|sed 's|\.|_|g').tar.xz")
sha256sums=('e480b86d99edaeb079f66774742e56b76fb5957b8c7b3dbffdf0f69ee46b7c50')

build() {
  cd "$srcdir/GNOME_TODO_$(echo ${pkgver}|sed 's|\.|_|g')"
  ./autogen.sh --prefix=/usr --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/GNOME_TODO_$(echo ${pkgver}|sed 's|\.|_|g')"
  make DESTDIR="${pkgdir}" install
}
