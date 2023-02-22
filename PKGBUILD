# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Josia Roßkopf <josia-login@rosskopfs.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>
pkgname=nwjs-bin
pkgver=0.73.0
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
sha256sums=('0b62656af8229c954f5fc8fd8cc8f3e80253a637dc2643139361f092cb741cc0')

package() {
  cd "${pkgname%-bin}-v${pkgver}-linux-x64"

  install -d "${pkgdir}/opt/${pkgname%-bin}"
  cp -dr * "${pkgdir}/opt/${pkgname%-bin}/"
  chmod -R 644 "${pkgdir}/opt/${pkgname%-bin}/"
  chmod 755 "${pkgdir}/opt/${pkgname%-bin}/"{,swiftshader,lib,locales,nw,chrome_crashpad_handler}

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname%-bin}/nw" "${pkgdir}/usr/bin/nw"
}
# vim:set ts=2 sw=2 et:
