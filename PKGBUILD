# Contributor: Jussi Timperi <gmail.com: jussi.timperi>
# Maintainer:  Jesse Jaara   <gmail.com: jesse.jaara>

pkgname=voikko-libreoffice
pkgver=5.0
pkgrel=1
pkgdesc="Finnish spellchecker, grammar checker and hyphenator extension for libreoffice"
arch=('any')
url="http://voikko.sourceforge.net"
license=('MPL')
depends=('voikko-fi' 'libreoffice' 'python')
makedepends=('zip')
install=voikko-libreoffice.install
source=("http://www.puimula.org/voikko-sources/libreoffice-voikko/libreoffice-voikko-${pkgver}.tar.gz"
        "http://www.puimula.org/voikko-sources/libreoffice-voikko/libreoffice-voikko-${pkgver}.tar.gz.asc")
md5sums=('594c68d586cbf8aaea5fda4a8547c60e'
         'SKIP')
validpgpkeys=('AC5D65F10C8596D7E2DAE2633D309B604AE3942E') 

build() {
  cd "${srcdir}/libreoffice-voikko-${pkgver}"

  make oxt
}

package() {
  cd "${srcdir}/libreoffice-voikko-${pkgver}/build" 

  install -D -m644 voikko.oxt "${pkgdir}/usr/lib/libreoffice/share/extensions/install/voikko.oxt"
}
