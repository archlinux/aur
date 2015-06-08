# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=dbus-cxx
pkgver=0.8.0
pkgrel=2
pkgdesc="A C++ wrapper for DBus"
url="http://dbus-cxx.sourceforge.net/"
arch=('i686' 'x86_64')
license=( "GPL3" )
depends=( "dbus" "libsigc++" "popt" "glibmm" )
source=( "http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2" )
sha1sums=('e5c77bbce9fd3f9a5a8788a20715a4e4fb33c9ee')

build() {
  cd $srcdir/$pkgname-$pkgver
  autoconf
  ./configure --prefix=/usr --enable-glibmm 
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make install DESTDIR="$pkgdir"
}
