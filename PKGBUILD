# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=pi-acp
pkgver=0.0.35 # renovate: datasource=npm depName=pi-acp
pkgrel=1
pkgdesc="ACP adapter for the pi coding agent"
arch=("any")
url="https://github.com/svkozak/pi-acp"
license=("MIT")
depends=("nodejs" "pi")
makedepends=("npm")
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha512sums=('259021606f4f449e474f27d09e42870d3b73aa7b8f14c3d6a0036db6b901c8dfba97f8fcc0b4aacc4fef50290658e7692f32e4148135544ca8c7dd73c908a74d')

package() {
  npm install --omit=dev -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  install -Dm644 "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  chmod go-w -R "${pkgdir}"
}

#vim: syntax=sh
