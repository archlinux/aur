# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=s6
pkgver=2.4.0.0
pkgrel=1
pkgdesc="A small suite of programs for UNIX, designed to allow process supervision"
arch=('i686' 'x86_64')
url="http://skarnet.org/software/${pkgname}/"
license=('ISC')
depends=('skalibs>=2.4.0.0' 'execline')
source=("http://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5e788d5935dbcce76ac9a99cfcf6ee46a2ffb84220c84225df7589e9a3585560')

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
