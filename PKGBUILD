# Maintainer: Samuel Laurén <samuel.lauren@iki.fi>
pkgname=rainbowpath
pkgver=0.4
pkgrel=1
pkgdesc="Program for making paths pretty."
arch=("x86_64")
url="https://github.com/Soft/rainbowpath"
license=("MIT")
depends=(ncurses)
makedepends=()
source=("https://github.com/Soft/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("34e6cf35e46fb371eb45a3b4eacf1c7ebc32e69c318421e33aa0a4cd518ce659")

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --with-curses
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -s -D -m755 -D src/${pkgname} "$pkgdir/usr/bin/${pkgname}"
  install -D -m644 -D man/${pkgname}.1 "$pkgdir/usr/share/man/man1/${pkgname}.1"
}

# vim:set ts=2 sw=2 et:
