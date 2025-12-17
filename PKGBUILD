# Maintainer: NeoTheFox <aur at repraptor.33mail.com>
# Maintainer: Henry Graham <henry)dot(arch)at(hgrahamcs)dot(com(>

pkgname=edmarketconnector
pkgver=6.0.0
pkgrel=1
pkgdesc='Downloads commodity market and other station data from the game Elite: Dangerous for use with all popular online and offline trading tools'
arch=('x86_64')
url='https://github.com/EDCD/EDMarketConnector'
license=('GPL2')
provides=('edmarketconnector')
conflicts=('edmarketconnector')
depends=('tk' 'python-certifi' 'python-requests' 'python-watchdog' 'python-semantic-version' 'python-psutil' 'python-tomli-w')
source=("https://github.com/EDCD/EDMarketConnector/releases/download/Release%2F${pkgver}/EDMarketConnector-release-${pkgver}.tar.gz"
  "edmarketconnector.sh"
  "edmarketconnector.desktop"
  "edmarketconnector.svg")
sha256sums=('915157c2141304c828f8cefac3be7c031ef54ecd748ba2497b434685fa32dca3'
  '9a78ba9acb74e3d8c5a2a051cb058e113437dd786f6e8ed863398f4176a3b8a7'
  '204d4fb3d8d6b907d618d581fa32559d5270f16c65e8818ffcf836a554c5e3d3'
  '91f7fdd2f960bdaec07bfa6611d03b74d7be5f561b5b36363473db3c41b6c518')

package() {
  mkdir -p ${pkgdir}/usr/lib/edmarketconnector
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/share/applications
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/scalable/apps
  cp ${srcdir}/EDMarketConnector/* ${pkgdir}/usr/lib/edmarketconnector -r
  install -m755 edmarketconnector.sh ${pkgdir}/usr/bin/edmarketconnector.sh
  install -m644 edmarketconnector.desktop ${pkgdir}/usr/share/applications/edmarketconnector.desktop
  install -m644 edmarketconnector.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/edmarketconnector.svg
}
