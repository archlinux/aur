# Contributor: Stas Elensky <stas-at-flexsys-dot-com-dot-ua>
# Contributor: honzor 

pkgname=libmodbus-dev
pkgver=3.1.2
pkgrel=1
pkgdesc="A Modbus library for Linux, Mac OS X, FreeBSD, QNX and Win32 (development version)"
arch=('i686' 'x86_64')
url="http://libmodbus.org"
license=('LGPL')
groups=()
depends=()
makedepends=(asciidoc xmlto)
optdepends=()
provides=(libmodbus)
conflicts=(libmodbus)
replaces=()
backup=()
options=(!libtool)
install=
_pkgfqn="libmodbus-${pkgver}"
source=(http://libmodbus.org/releases/libmodbus-$pkgver.tar.gz)
md5sums=(dd4262f87ed835c4d1e560f8321a222c)
noextract=()


build() {
  cd "$srcdir/$_pkgfqn"
  autoreconf --install --symlink --force
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgfqn"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
