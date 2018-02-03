# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Josh VanderLinden <arch@cloudlery.com>
pkgname=s6
pkgver=2.7.0.0
pkgrel=2
pkgdesc="A small suite of programs for UNIX, designed to allow process supervision"
arch=('x86_64')
url="http://skarnet.org/software/${pkgname}/"
license=('ISC')
depends=('skalibs' 'execline-no-conflicts')
source=("http://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6617cbf82c73273c67c6102a1a5c48449ef65ffbe8d0db6a587b7f0078dc6e13')

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
