# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Clément Démoulins <demoulins@lrde.epita.fr>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=spot
pkgver=2.10
pkgrel=1
pkgdesc="A C++14 library for omega automata manipulation and model checking."
arch=('i686' 'x86_64')
url="https://spot.lrde.epita.fr/"
license=('GPL3')
depends=('glibc' 'sh' 'python' 'libtool')
source=(http://www.lrde.epita.fr/dload/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('966e323c1b9c11114adbf0030a852a571164f181d99e31bd616afe913c523160')

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
