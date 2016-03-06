# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=s6
pkgver=2.2.4.3
pkgrel=1
pkgdesc="A small suite of programs for UNIX, designed to allow process supervision"
arch=('i686' 'x86_64')
url="http://skarnet.org/software/${pkgname}/"
license=('ISC')
depends=('skalibs' 'execline')
source=("http://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f584ec56d5f2a3a2d81698d5f744b9b64d8fb6c22b56649faa71f3b62da7db3f')

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
