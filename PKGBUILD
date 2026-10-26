# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=pi-acp
pkgver=0.0.34 # renovate: datasource=npm depName=pi-acp
pkgrel=1
pkgdesc="ACP adapter for the pi coding agent"
arch=("any")
url="https://github.com/svkozak/pi-acp"
license=("MIT")
depends=("nodejs" "pi")
makedepends=("npm")
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha512sums=('32b0a9dfb51ba54ce44e4cd320c2507f5458ad3fa4af87e0183185a0b981376e94ba9b82669d17c55218fbb5d8b0ca37c839f30de6542748cfc8cdd28ba06492')

package() {
  npm install --omit=dev -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  install -Dm644 "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  chmod go-w -R "${pkgdir}"
}

#vim: syntax=sh
