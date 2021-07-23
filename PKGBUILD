# Maintainer: buzz
_libname_=statusnotifier
pkgname=${_libname_}-introspection-dbus-menu
pkgver=1.0.0
pkgrel=1
pkgdesc="Library to use KDE's StatusNotifierItem via GObject (Introspection/D-Bus menu enabled)"
arch=('i686' 'x86_64')
url="https://jjacky.com/${_libname_}"
license=('GPL3+')
depends=('glib2' 'gtk3' 'gdk-pixbuf2')
provides=("${_libname_}")
conflicts=("${_libname_}")
source=(https://jjacky.com/${_libname_}/${_libname_}-$pkgver.tar.xz)
sha256sums=('d7f169355755e0da250a49919b3df2f4cb6a220606fcb6b1bd2e1e60afbcef9a')

build() {
  cd "$srcdir/${_libname_}-$pkgver"
  ./configure --prefix=/usr --enable-introspection=yes --enable-dbusmenu
  make
}

package() {
  cd "$srcdir/${_libname_}-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
