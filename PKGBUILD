# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=gtksheet
pkgver=4.3.3
pkgrel=1
pkgdesc="A spreadsheet widget for Gtk+"
arch=('any')
url=http://fpaquet.github.io/gtksheet/
license=('GPL2')
depends=(gtk3 pango cairo atk)
makedepends=(autoconf)
source=(https://github.com/fpaquet/gtksheet/archive/V${pkgver}.tar.gz)
sha256sums=('b9eedd2111ea3c8e4b577965a15b003265f95edb98da11d588247085a69b8f59')


prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -i
  ./configure --prefix=${pkgdir}/usr
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:ts=2:sw=2:et:
