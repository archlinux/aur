# Maintainer: David Adler <david dot jo dot adler at gmail dot com>
pkgname=nl-filter
pkgver=0.1.0
pkgrel=1
pkgdesc="LADSPA implementation of the Dobson-Ffitch non-linear filter"
arch=('i686' 'x86_64')
url="http://www.skynet.ie/~jmmcd/development.html"
license=('GPL')
depends=('glibc')
options=(!libtool)
source=(http://www.skynet.ie/~jmmcd/software/$pkgname-$pkgver.tar.gz)
md5sums=('0d6211f4b802b29317b068951dece2e7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
