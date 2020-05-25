# Maintainer: Evgeny Shvits <tony.darko@gmail.com>

pkgname=ch341eepromtool
pkgver=0.5
pkgrel=2
_git_commit="6b41e07"
pkgdesc="An i2c serial EEPROM programming tool for the WCH CH341A"
arch=('i686' 'x86_64')
url="https://github.com/stefanct/ch341eepromtool"
license=('GPL3')
depends=('libusb>=1')
source=("git+https://github.com/stefanct/ch341eepromtool.git#commit=${_git_commit}")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  gcc ${CFLAGS} -o ch341eeprom ch341eeprom.c ch341funcs.c ${LDFLAGS} -lusb-1.0
}

package() {
  cd "${srcdir}/${pkgname}"

  # Install the program
  install -Dm755 ch341eeprom "${pkgdir}/usr/bin/ch341eeprom"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ft=sh ts=2 sw=2 et:
