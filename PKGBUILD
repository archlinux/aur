# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Josh VanderLinden <arch@cloudlery.com>

pkgname=execline
pkgver=2.1.5.0
pkgrel=1
pkgdesc="A (non-interactive) scripting language, like sh"
arch=('i686' 'x86_64')
url="http://skarnet.org/software/${pkgname}/"
license=('ISC')
depends=('skalibs')
#/usr/bin/import conflicts
conflicts=('imagemagick')
source=("http://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8a3605a6db73183baa376bf2130e8b7eb75a5b5347c7f9144e520fe86bcb1142')

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
