# Contributor: Stas Elensky <stas-at-flexsys-dot-com-dot-ua>
# Contributor: honzor 

pkgname=libmodbus
pkgver=3.0.6
pkgrel=1
pkgdesc="A Modbus library for Linux, Mac OS X, FreeBSD, QNX and Win32"
arch=('i686' 'x86_64')
url="http://libmodbus.org"
license=('LGPL')
groups=()
depends=()
makedepends=(asciidoc xmlto)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!libtool)
install=
source=(http://libmodbus.org/releases/libmodbus-$pkgver.tar.gz)
md5sums=('c80f88b6ca19cabc4ceffc195ca07771')
noextract=()


build() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf --install --symlink --force
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
