# Maintainer: restitux <restitux@ohea.xyz>

_pkgname=pyscript
pkgname=home-assistant-pyscript
pkgver=2.0.1
pkgrel=1
pkgdesc="Pyscript adds rich Python scripting to HASS"
arch=(any)
url="https://github.com/custom-components/pyscript"
license=("Apache-2.0")
depends=("home-assistant")
source=("$pkgname-$pkgver.tar.gz::https://github.com/custom-components/pyscript/archive/${pkgver}.tar.gz")
b2sums=('196bbb9f43856ed3dc63abad0b75daf600cb6202358e3ad8b8358ef05b9f82f84ffe9e3401db69e72ed305ed9cb4104ccadca03e426c236e0a03811b9f19868f')

package() {
  cd "$_pkgname-$pkgver"

  find "custom_components/pyscript" -type f -exec install -vDm 644 {} "${pkgdir}/var/lib/private/hass/"{} \;
  chmod 700 "${pkgdir}/var/lib/private"

  install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
