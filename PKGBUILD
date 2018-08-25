# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=nwjs-sdk-bin
pkgver=0.32.4
pkgrel=1
pkgdesc="An app runtime based on Chromium and node.js (SDK version)."
arch=("x86_64")
url="https://nwjs.io/"
license=("MIT")
depends=("gtk3" "nss" "libxss")
optdepends=(
  "nodejs: npm package support"
  "nw-gyp: native add-on build tool for node-webkit"
)
options=(!strip)
provides=("nwjs" "node-webkit")
conflicts=("nwjs" "node-webkit")
source=("${pkgname}-${pkgver}.tar.gz::http://dl.nwjs.io/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-x64.tar.gz")
sha256sums=('19fd28e199d90cf9a606873f34c66ca803bfbdc616612f3998d08c017f43a754')

package() {
  cd "${pkgname%-bin}-v${pkgver}-linux-x64"
  install -d "${pkgdir}/opt/${pkgname%-bin}"
  install -d "${pkgdir}/usr/bin"
  cp -a * "${pkgdir}/opt/${pkgname%-bin}"
  ln -s "/opt/${pkgname%-bin}/nw" "${pkgdir}/usr/bin/nw"
  ln -s "/opt/${pkgname%-bin}/nwjc" "${pkgdir}/usr/bin/nwjc"
}
# vim:set ts=2 sw=2 et:
