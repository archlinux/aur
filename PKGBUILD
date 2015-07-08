# Contributor: Jussi Timperi <gmail.com: jussi.timperi>
# Maintainer:  Jesse Jaara   <gmail.com: jesse.jaara>

pkgname=voikko-libreoffice
pkgver=4.1
pkgrel=3
pkgdesc="Finnish spellchecker, grammar checker and hyphenator extension for libreoffice"
arch=('i686' 'x86_64')
url="http://voikko.sourceforge.net"
license=('GPL3')
depends=('libvoikko' 'libreoffice')
makedepends=('zip' 'libreoffice-sdk')
install=voikko-libreoffice.install
source=("http://www.puimula.org/voikko-sources/libreoffice-voikko/libreoffice-voikko-${pkgver}.tar.gz")
md5sums=('a07b386d4f4356b686e667a2acb1aff6')

build() {
  cd "${srcdir}/libreoffice-voikko-${pkgver}"

  . /usr/lib/libreoffice/sdk/setsdkenv_unix.sh

  make oxt
}

package() {
  cd "${srcdir}/libreoffice-voikko-${pkgver}/build" 

  install -D -m644 voikko.oxt "${pkgdir}/usr/lib/libreoffice/share/extensions/install/voikko.oxt"
}

