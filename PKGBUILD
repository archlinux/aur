# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>
pkgname=connman-gtk
pkgver=1.0
pkgrel=1
pkgdesc="GTK GUI for ConnMan"
arch=('i686' 'x86_64')
url="https://github.com/jgke/connman-gtk"
license=('GPL')
depends=('intltool' 'glib2' 'gtk3')
makedepends=('git')
source=("git+https://github.com/jgke/connman-gtk.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/$pkgname"
  ./autogen.sh
  ./configure
  make
}

package() {
  cd "${srcdir}/$pkgname"
  make DESTDIR=$pkgdir install
}

