# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=serial-port-json-server
pkgver=1.95
pkgrel=1
pkgdesc="A websocket server for your serial devices. (generally used for chilipeppr)"
arch=('i686' 'x86_64' 'arm')
url="https://github.com/chilipeppr/serial-port-json-server"
license=('GPL2')

source_arm=(${pkgname}-$pkgver.tar.gz::https://github.com/chilipeppr/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}_linux_arm.tar.gz)
source_i686=(${pkgname}-$pkgver.tar.gz::https://github.com/chilipeppr/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}_linux_386.tar.gz)
source_x86_64=(${pkgname}-$pkgver.tar.gz::https://github.com/chilipeppr/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}_linux_amd64.tar.gz)
md5sums_i686=('6ab2d789ec8b279b5ada0e9f8c8e0d46')
md5sums_x86_64=('cee9a0c8a849327c2030688cc8d41e9d')
md5sums_arm=('1ba3f4df57673b0347d830b329e62305')

package() {
  if [ $CARCH == "arm" ]; then _arch="arm"
  elif [ $CARCH == "i686" ]; then _arch="386"
  elif [ $CARCH == "x86_64" ]; then _arch="amd64"
  fi
  cd "${srcdir}/${pkgname}-${pkgver}_linux_${_arch}"

  install -Dm755 serial-port-json-server "${pkgdir}/usr/bin/serial-port-json-server"
}

# vim:set ts=2 sw=2 et:
