# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=nwjs-sdk-bin
pkgver=0.35.3
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
sha256sums=('800749baaa9288a3f27ccc31861e192ef40cabbdc6eaeb6bc0558c6c8e488b74')

package() {
  cd "${pkgname%-bin}-v${pkgver}-linux-x64"
  install -d "${pkgdir}/opt/${pkgname%-bin}"
  install -d "${pkgdir}/usr/bin"
  cp -a * "${pkgdir}/opt/${pkgname%-bin}"
  ln -s "/opt/${pkgname%-bin}/nw" "${pkgdir}/usr/bin/nw"
  ln -s "/opt/${pkgname%-bin}/nwjc" "${pkgdir}/usr/bin/nwjc"
}
# vim:set ts=2 sw=2 et:
