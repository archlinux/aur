# Maintainer: Alexander Rødseth <rodseth@gmail.com>
pkgname=gdlmm
pkgver=3.3.2
pkgrel=2
pkgdesc="C++ bindings for the gdl library"
arch=('x86_64' 'i686')
url="http://git.gnome.org/browse/gdlmm/"
depends=('gdl' 'gtkmm3')
options=(!libtool !emptydirs)
license=('LGPL')
source=("http://ftp.gnome.org/pub/GNOME/sources/gdlmm/3.3/$pkgname-$pkgver.tar.xz")
sha256sums=('cf3253be052737332b2b6e9dbd6f62d79cbc3f3398497158c0099dbc45741a46')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
