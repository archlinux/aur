# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Clément Démoulins <demoulins@lrde.epita.fr>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=spot
pkgver=2.9.3
pkgrel=1
pkgdesc="A C++14 library for omega automata manipulation and model checking."
arch=('i686' 'x86_64')
url="https://spot.lrde.epita.fr/"
license=('GPL3')
depends=('glibc' 'sh' 'python' 'libtool')
source=(http://www.lrde.epita.fr/dload/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('02a348272329d4931905a586f7197b518ac6fa411aeeea2acac55d6d490ecd1e')

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
