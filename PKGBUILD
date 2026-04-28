# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=nodejs-paperclipai
pkgver=2026.427.0 # renovate: datasource=npm depName=paperclipai
pkgrel=1
pkgdesc="Paperclip CLI — orchestrate AI agent teams to run a business"
arch=("x86_64")
url="https://github.com/paperclipai/paperclip"
license=("MIT")
depends=("nodejs")
makedepends=("npm" "python" "nodejs-addon-api")
source=("https://registry.npmjs.org/${pkgname#nodejs-}/-/${pkgname#nodejs-}-${pkgver}.tgz")
noextract=("${pkgname#nodejs-}-${pkgver}.tgz")
sha512sums=('0010f3bba4a2a752870510c3c059b71388d5490e702a0656b00cdf6529ebe52d29095d968f0a7f59e7d9dd227a47c24274679fff71e27db0c123ea4055728d78')

package() {
  export NODE_PATH=/usr/lib/node_modules
  npm install --omit=dev -g --prefix "${pkgdir}/usr" "${pkgname#nodejs-}@${pkgver}"

  install -dm644 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm755 "${pkgdir}/usr/lib/node_modules/${pkgname#nodejs-}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"

  chmod go-w -R "${pkgdir}"
}

#vim: syntax=sh
