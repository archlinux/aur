# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=execline
pkgver=2.1.2.2
pkgrel=1
pkgdesc="A (non-interactive) scripting language, like sh"
arch=('i686' 'x86_64')
url="http://skarnet.org/software/${pkgname}/"
license=('ISC')
depends=('skalibs')
source=("http://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('aea08c2c1b986c91f300d40737dd43067b91705d2c729859344ec65f989aec06')

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
