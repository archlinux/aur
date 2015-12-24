# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=execline
pkgver=2.1.4.5
pkgrel=1
pkgdesc="A (non-interactive) scripting language, like sh"
arch=('i686' 'x86_64')
url="http://skarnet.org/software/${pkgname}/"
license=('ISC')
depends=('skalibs')
#/usr/bin/import conflicts
conflicts=('imagemagick')
source=("http://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ab4451d4992a5d7fb2ae34cffe4d0806e4902bf9aa27ee3b75617aa35379356f')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr/lib/execline/bin

  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  DESTDIR=${pkgdir} make install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:ft=sh ts=2 sw=2 et:
