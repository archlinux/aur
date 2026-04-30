# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=nodejs-paperclipai
pkgver=2026.428.0 # renovate: datasource=npm depName=paperclipai
pkgrel=1
pkgdesc="Paperclip CLI — orchestrate AI agent teams to run a business"
arch=("x86_64")
url="https://github.com/paperclipai/paperclip"
license=("MIT")
depends=("nodejs")
makedepends=("npm" "python" "nodejs-addon-api")
source=("https://registry.npmjs.org/${pkgname#nodejs-}/-/${pkgname#nodejs-}-${pkgver}.tgz")
noextract=("${pkgname#nodejs-}-${pkgver}.tgz")
sha512sums=('96e30333f44d8b27d38147a72a8363400f75138aab67a1f1b97b4e38926115aeffc7f50336b9ca7e1ffb9caec79087a4434e62aae46670c27e3c9fac6f8bc1da')

package() {
  export NODE_PATH=/usr/lib/node_modules
  npm install --omit=dev -g --prefix "${pkgdir}/usr" "${pkgname#nodejs-}@${pkgver}"

  install -dm644 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm755 "${pkgdir}/usr/lib/node_modules/${pkgname#nodejs-}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"

  chmod go-w -R "${pkgdir}"
}

#vim: syntax=sh
