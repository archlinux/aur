# Maintainer: Samuel Laurén <samuel.lauren@iki.fi>
pkgname=rainbowpath
pkgver=0.5.2
pkgrel=1
pkgdesc="Program for making paths pretty."
arch=("x86_64")
url="https://github.com/Soft/rainbowpath"
license=("MIT")
depends=(ncurses)
makedepends=()
source=("https://github.com/Soft/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("d6a46f042d349038a8082ea7f475a409c8aabdab8ad720a0ef44be74e0f8f53c")

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
