# Maintainer: Evgeny Shvits <tony.darko@gmail.com>

pkgname=ch341eepromtool
pkgver=0.5
pkgrel=1
pkgdesc="An i2c serial EEPROM programming tool for the WCH CH341A"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ch341eepromtool/"
license=('GPL')
depends=('libusb>=1')
source=("http://sourceforge.net/projects/ch341eepromtool/files/ch341eepromtool_0.5.tar.gz/download")
md5sums=('c3e862001099d8a8ab95e4eccd2e267b')

build() {
  cd "${srcdir}/${pkgname}_${pkgver}"
  gcc ${CFLAGS} -o ch341eeprom ch341eeprom.c ch341funcs.c ${LDFLAGS} -lusb-1.0
}

package() {
  cd "${srcdir}/${pkgname}_${pkgver}"

  # Install the program
  install -Dm755 ch341eeprom "${pkgdir}/usr/bin/ch341eeprom"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:set ft=sh ts=2 sw=2 et:
