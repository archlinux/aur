# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Clément Démoulins <demoulins@lrde.epita.fr>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=spot
pkgver=2.11.3
pkgrel=1
pkgdesc="A C++17 library for LTL, omega automata manipulation and model checking."
arch=('i686' 'x86_64')
url="https://spot.lrde.epita.fr/"
license=('GPL3')
depends=('glibc' 'sh' 'python' 'libtool')
source=(http://www.lrde.epita.fr/dload/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('c32c8be65cf22d9420c533c7e758ac5b08257beaa674980f647bfb65e6953343')

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
