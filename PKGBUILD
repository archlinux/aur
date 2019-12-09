# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Clément Démoulins <demoulins@lrde.epita.fr>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=spot
pkgver=2.8.4
pkgrel=1
pkgdesc="A C++11 library for omega automata manipulation and model checking."
arch=('i686' 'x86_64')
url="https://spot.lrde.epita.fr/"
license=('GPL3')
depends=('glibc' 'sh' 'python')
source=(http://www.lrde.epita.fr/dload/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('3f71df2874a3dbc92983c5bf060fba0eb0ed13acaadc9af3542ab793a0de50f9')

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
