# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=spot
pkgver=2.0
pkgrel=1
pkgdesc="Spot is a C++11 library for omega automata manipulation and model checking."
arch=('i686' 'x86_64')
url="https://spot.lrde.epita.fr/index.html"
license=('GPL3')
depends=('glibc' 'sh' 'python')
source=(http://www.lrde.epita.fr/dload/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('40ee69d8c7d9104d1474e64c8fc2361759715736067ba9c9bff5395a6b1a2192')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
