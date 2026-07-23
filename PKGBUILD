# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=nodejs-paperclipai
pkgver=2026.722.0 # renovate: datasource=npm depName=paperclipai
pkgrel=1
pkgdesc="Paperclip CLI — orchestrate AI agent teams to run a business"
arch=("x86_64")
url="https://github.com/paperclipai/paperclip"
license=("MIT")
depends=("nodejs")
makedepends=("npm" "python" "nodejs-addon-api")
source=("https://registry.npmjs.org/${pkgname#nodejs-}/-/${pkgname#nodejs-}-${pkgver}.tgz")
noextract=("${pkgname#nodejs-}-${pkgver}.tgz")
sha512sums=('936e0f504a86e57b7bb4b5d594a0b368730228bbe76d6d5c90673038ea80c579f0edb62c7739fa90f86f6b385f0f28104c4b358dbf617ec4e6b58ae68a462a0a')

package() {
  export NODE_PATH=/usr/lib/node_modules
  npm install --omit=dev -g --prefix "${pkgdir}/usr" "${pkgname#nodejs-}@${pkgver}"

  install -dm644 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm755 "${pkgdir}/usr/lib/node_modules/${pkgname#nodejs-}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"

  chmod go-w -R "${pkgdir}"
}

#vim: syntax=sh
