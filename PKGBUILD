#Mantainer: M0Rf30

pkgname=printerd-git
pkgver=117.b69008d
pkgrel=1
pkgdesc="A daemon to manage local and remote printers on Linux."
arch=('i686' 'x86_64')
url="https://github.com/hughsie/printerd"
license=('GPL2')
depends=('gnome-common' 'gobject-introspection')
makedepends=('git' 'intltool' 'gtk-doc')
source=('printerd::git://github.com/hughsie/printerd.git')


build() {
  cd printerd
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
} 

package() {
  cd printerd 
  make DESTDIR=$pkgdir install
}

pkgver() {
  cd printerd
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')