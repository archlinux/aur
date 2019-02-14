# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Clément Démoulins <demoulins@lrde.epita.fr>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=spot
pkgver=2.7.1
pkgrel=1
pkgdesc="A C++11 library for omega automata manipulation and model checking."
arch=('i686' 'x86_64')
url="https://spot.lrde.epita.fr/"
license=('GPL3')
depends=('glibc' 'sh' 'python')
source=(http://www.lrde.epita.fr/dload/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('320c4530ea2c6bf7c9c5dfca3410ff86fe75bb2e28a2fe87ca95cf6fc58430bb')

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
