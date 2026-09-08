# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=nodejs-paperclipai
pkgver=2026.831.1 # renovate: datasource=npm depName=paperclipai
pkgrel=1
pkgdesc="Paperclip CLI — orchestrate AI agent teams to run a business"
arch=("x86_64")
url="https://github.com/paperclipai/paperclip"
license=("MIT")
depends=("nodejs")
makedepends=("npm" "python" "nodejs-addon-api")
source=("https://registry.npmjs.org/${pkgname#nodejs-}/-/${pkgname#nodejs-}-${pkgver}.tgz")
noextract=("${pkgname#nodejs-}-${pkgver}.tgz")
sha512sums=('2d49a12c8c56329bc8dbca408fd371500b130399ef64826c6ececb026ec911b66a1fc797e8e547d30cde28e3524dc456c84ead2d3cf6ab38883d2a22b1c14aed')

package() {
  export NODE_PATH=/usr/lib/node_modules
  npm install --omit=dev -g --prefix "${pkgdir}/usr" "${pkgname#nodejs-}@${pkgver}"

  install -dm644 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm755 "${pkgdir}/usr/lib/node_modules/${pkgname#nodejs-}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"

  chmod go-w -R "${pkgdir}"
}

#vim: syntax=sh
