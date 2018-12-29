# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Josia Roßkopf <josia-login@rosskopfs.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>

pkgname=nwjs-bin
pkgver=0.35.3
pkgrel=1
pkgdesc="An app runtime based on Chromium and node.js."
arch=("x86_64")
url="https://nwjs.io/"
license=("MIT")
depends=("gtk3" "nss" "libxss")
optdepends=(
  "nodejs: npm package support"
  "nw-gyp: native add-on build tool for node-webkit"
)
provides=("nwjs" "node-webkit")
replaces=("node-webkit")
conflicts=("nwjs" "node-webkit")
source=("${pkgname}-${pkgver}.tar.gz::http://dl.nwjs.io/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-x64.tar.gz")
sha256sums=('5a6454efa4b98d952d3da97a9ae6ac4a65b38a22a88e0a5cc54f67a0b44ba37f')

package() {
  cd "${pkgname%-bin}-v${pkgver}-linux-x64"
  install -d "${pkgdir}/opt/${pkgname%-bin}"
  install -d "${pkgdir}/usr/bin"
  cp -a * "${pkgdir}/opt/${pkgname%-bin}/"
  ln -s "/opt/${pkgname%-bin}/nw" "${pkgdir}/usr/bin/nw"
}
# vim:set ts=2 sw=2 et:
