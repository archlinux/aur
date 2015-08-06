# Maintainer: Marcin Kornat <rarvolt+aur@gmail.com>
# Contributor: MatejSpindler <spindler.matej@gmail.com>

pkgname=esptool-git
pkgver=1
pkgrel=4
pkgdesc="A cute Python utility to communicate with the ROM bootloader in Espressif ESP8266"
arch=('any')
url="https://github.com/themadinventor/esptool"
license=('GPL2')
makedepends=('git')
depends=('python2-pyserial')
source=(esptool::git+https://github.com/themadinventor/esptool)
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/esptool"
  sed -i 's/python/python2/' esptool.py
}

package() {
  cd "${srcdir}/esptool"
  install -Dm755  esptool.py "${pkgdir}/usr/bin/esptool.py"
}

