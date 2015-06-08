# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=s6
pkgver=2.1.3.0
pkgrel=1
pkgdesc="A small suite of programs for UNIX, designed to allow process supervision"
arch=('i686' 'x86_64')
url="http://skarnet.org/software/${pkgname}/"
license=('ISC')
depends=('skalibs' 'execline')
source=("http://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('73057df188f1ac8db186b96298c0cb6081199aa73d3f2f8d5fabdbbe21c3ea04')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr

  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  DESTDIR=${pkgdir} make install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:ft=sh ts=2 sw=2 et:
