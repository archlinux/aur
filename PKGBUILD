# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>
pkgname=connman-gtk
pkgver=1.1.1
pkgrel=1
pkgdesc="GTK GUI for ConnMan"
arch=('i686' 'x86_64')
url="https://github.com/jgke/connman-gtk"
license=('GPL')
depends=('glib2' 'gtk3')
makedepends=('intltool' 'git' 'openconnect')
optdepends=('openconnect: for AnyConnect VPNs')
install=$pkgname.install
source=("git+https://github.com/jgke/connman-gtk.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/$pkgname"
  ./autogen.sh
  ./configure \
    --bindir=/usr/bin \
    --datarootdir=/usr/share \
    --mandir=/usr/share/man \
    --with-openconnect=dynamic
  make
}

package() {
  cd "${srcdir}/$pkgname"
  make DESTDIR="$pkgdir" install
}

