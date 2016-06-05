# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Marcin Kornat <rarvolt+aur@gmail.com>
# Contributor: MatejSpindler <spindler.matej@gmail.com>

pkgname=esptool
pkgver=1.1
pkgrel=1
pkgdesc="A cute Python utility to communicate with the ROM bootloader in Espressif ESP8266"
arch=('any')
url="https://github.com/themadinventor/esptool"
license=('GPL2')
makedepends=('git')
depends=('python2-pyserial')
source=("https://github.com/themadinventor/esptool/archive/v${pkgver}.tar.gz")
md5sums=('9e0c14ced8182adf33808e5a80d7b88e')

prepare() {
  cd "${srcdir}/esptool-${pkgver}"
  sed -i 's/python/python2/' esptool.py
}

package() {
  cd "${srcdir}/esptool-${pkgver}"
  install -Dm755 "esptool.py" "${pkgdir}/usr/bin/esptool"
}
