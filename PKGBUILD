# Contributor: CJlano <cjlano+aur.arabica - free.fr>
# Contributor: Macxcool <macx cool at tutanota dot com>
pkgname=arabica
pkgver=20200425
_realver=2020-April
pkgrel=1
pkgdesc="An XML and HTML processing toolkit, providing SAX2, DOM, XPath, and XSLT implementations, written in Standard C++"
arch=('i686' 'x86_64')
url="http://www.jezuk.co.uk/arabica"
license=('BSD')
depends=('gcc-libs' 'expat')

source=(https://github.com/jezhiggins/$pkgname/archive/refs/tags/$_realver.tar.gz)
md5sums=('dda3401d596699410da477e60a67647b')

build() {
  cd "$pkgname-$_realver"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$_realver"

  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
