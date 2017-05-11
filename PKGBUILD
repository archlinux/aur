# Contributor: MeMi69 <MetalMilitia@gmx.net>
pkgname=xcowsay
pkgver=1.4
pkgrel=1
pkgdesc="a program based on cowsay that displays a cute cow and message on your desktop"
arch=(i686 x86_64)
url="http://www.doof.me.uk/xcowsay"
license=('GPL')
groups=(games)
depends=('dbus' 'dbus-glib' 'cairo' 'gtk2')
install=
source=(http://www.nickg.me.uk/files/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('1e9933c6f48f1e8fffbeaeb6ba0e2bc8')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --enable-dbus
  make || return 1
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}


# vim:set ts=2 sw=2 et:
