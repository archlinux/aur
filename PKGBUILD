# Contributor: MeMi69 <MetalMilitia@gmx.net>
pkgname=xcowsay
pkgver=1.3
pkgrel=1
pkgdesc="xcowsay displays a cute cow and message on your desktop. Inspired by the original cowsay."
arch=(i686 x86_64)
url="http://www.doof.me.uk/xcowsay"
license=('GPL')
groups=(games)
depends=('dbus' 'dbus-glib' 'cairo' 'gtk2')
install=
source=(http://www.nickg.me.uk/files/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('ffcad22a9002d2a5c37d9d302b9614d1')

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
