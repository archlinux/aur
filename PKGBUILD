# Maintainer: CJlano <cjlano+aur.arabica - free.fr>
pkgname=arabica
pkgver=2016_January
pkgrel=1
pkgdesc="An XML and HTML processing toolkit, providing SAX2, DOM, XPath, and XSLT implementations, written in Standard C++"
arch=('i686' 'x86_64')
url="http://www.jezuk.co.uk/arabica"
license=('BSD')
depends=('gcc-libs' 'expat')
makedepends=('boost' 'expat')

source=(https://github.com/jezhiggins/$pkgname/archive/${pkgver/_/-}.tar.gz)
md5sums=('2ab97777049ac703e7ff03710ea9c1a2')

build() {
  cd "$pkgname-${pkgver/_/-}"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-${pkgver/_/-}"

  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
