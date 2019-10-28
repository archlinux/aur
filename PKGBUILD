# Maintainer: Jesse Jaaara <jesse.jaara@gmail.com>

pkgname=voikko-fi
pkgver=2.3
pkgrel=1
arch=('any')
url="http://voikko.puimula.org/"
pkgdesc="Finnish dictionary for libvoikko based spell checkers."
license=('GPL2')
makedepends=('libvoikko>=4.0' 'python' 'foma')
source=(http://www.puimula.org/voikko-sources/voikko-fi/voikko-fi-${pkgver}.tar.gz
        http://www.puimula.org/voikko-sources/voikko-fi/voikko-fi-${pkgver}.tar.gz.asc)
md5sums=('56ebc201d578380025b3c17f290c9045'
         'SKIP')
validpgpkeys=('AC5D65F10C8596D7E2DAE2633D309B604AE3942E')

build() {
  cd "${srcdir}/voikko-fi-${pkgver}"

  make vvfst
}

package() {
  cd "${srcdir}/voikko-fi-${pkgver}"

  make DESTDIR="${pkgdir}/usr/share/voikko/" vvfst-install
}

# vim:set ts=2 sw=2 et:
