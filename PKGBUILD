# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=s6
pkgver=2.5.0.0
pkgrel=1
pkgdesc="A small suite of programs for UNIX, designed to allow process supervision"
arch=('i686' 'x86_64')
url="http://skarnet.org/software/${pkgname}/"
license=('ISC')
depends=('skalibs>=2.5.0.0' 'execline>=2.3.0.0')
source=("http://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('11413aea4add3aea2d0f3f7515d274ac58d4adfb03661a1f6ce7fa2abd24dab1')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --bindir=/usr/bin --sbindir=/usr/bin

  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  DESTDIR=${pkgdir} make install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:ft=sh ts=2 sw=2 et:
