# Maintainer: Ian D. Scott <ian@perebruin.com>
pkgname=dsmidiwifi
pkgver=1.01
pkgrel=1
pkgdesc="DSMI Server"
url="http://dsmidiwifi.tobw.net/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('qt4' 'alsa-lib')
source=("https://dsmi.googlecode.com/files/${pkgname}-v${pkgver}.tgz")
md5sums=('e45703b1a37602d6326916d2ce1b404c')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}/source"
  qmake-qt4
  make
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}/source"
  install -Dm755 DSMIDIWiFi $pkgdir/usr/bin/DSMIDIWiFi
}

# vim:set ts=2 sw=2 et:
