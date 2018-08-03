# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=nodejs-terminalizer
pkgver=0.2.3
pkgrel=1
pkgdesc="Record your terminal and generate animated gif images"
arch=("x86_64")
url="https://github.com/faressoft/terminalizer"
license=("MIT")
depends=("gconf" "gtk3" "libxss" "nodejs" "npm" "nss")
source=("https://registry.npmjs.org/${pkgname#nodejs-}/-/${pkgname#nodejs-}-${pkgver}.tgz")
noextract=("${pkgname#nodejs-}-${pkgver}.tgz")
sha1sums=("99446a011b6e3e9d2c16ca4c1cdcb5cf672213ea")

package() {
  cd "${srcdir}"
  
  msg2 "Installing using npm..."
  npm install --user root -g --prefix "${pkgdir}/usr" "${pkgname#nodejs-}@${pkgver}"
  
  msg2 "Installing license file in /usr/share/licenses/${pkgname} ..."
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm755 "${pkgdir}/usr/lib/node_modules/terminalizer/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
