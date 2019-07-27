# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=serial-port-json-server
pkgver=1.96
pkgrel=1
pkgdesc="A websocket server for your serial devices. (generally used for chilipeppr)"
arch=('i686' 'x86_64' 'arm')
url="https://github.com/chilipeppr/serial-port-json-server"
license=('GPL2')

source_arm=(https://github.com/chilipeppr/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}_linux_arm.tar.gz)
source_i686=(https://github.com/chilipeppr/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}_linux_386.tar.gz)
source_x86_64=(https://github.com/chilipeppr/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}_linux_amd64.tar.gz)
md5sums_i686=('f9f072f07e273a54c69ca9b5a017e820')
md5sums_x86_64=('dd212481b330eea23313bddc2ffb69db')
md5sums_arm=('ab4bb9dd0d23ab610ed3028580ffe652')

package() {
  if [ $CARCH == "arm" ]; then _arch="arm"
  elif [ $CARCH == "i686" ]; then _arch="386"
  elif [ $CARCH == "x86_64" ]; then _arch="amd64"
  fi
  cd "${srcdir}/${pkgname}-${pkgver}_linux_${_arch}"

  install -Dm755 serial-port-json-server "${pkgdir}/usr/bin/serial-port-json-server"
}

# vim:set ts=2 sw=2 et:
