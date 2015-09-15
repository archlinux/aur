# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=tkpng
pkgver=0.9
pkgrel=1
pkgdesc="An open source binary package that adds PNG photo image support to Tcl/Tk."
arch=(i686 x86_64)
url="http://www.muonics.com/FreeStuff/TkPNG/"
license=('custom')
depends=('tk')
options=('!emptydirs')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname$pkgver.tgz")
md5sums=('43347d3d805a5bf3ff428ed812834230')

build() {
  cd "$srcdir/$pkgname$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname$pkgver"

  make DESTDIR="$pkgdir/" install

  # License file
  install -Dm 644 license.terms "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
