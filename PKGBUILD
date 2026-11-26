# Maintainer: restitux <restitux@ohea.xyz>

_pkgname=pyscript
pkgname=home-assistant-pyscript
pkgver=2.1.1
pkgrel=1
pkgdesc="Pyscript adds rich Python scripting to HASS"
arch=(any)
url="https://github.com/custom-components/pyscript"
license=("Apache-2.0")
depends=("home-assistant")
source=("$pkgname-$pkgver.tar.gz::https://github.com/custom-components/pyscript/archive/${pkgver}.tar.gz")
b2sums=('2db0bb386d9e5168b56e7147b654089f7f1f1e36789f7018615ba9bbc8ac411aa67913df064510bee2e688cbf10e1f32c77b316725071e23c609d4e89de6fff2')

package() {
  cd "$_pkgname-$pkgver"

  find "custom_components/pyscript" -type f -exec install -vDm 644 {} "${pkgdir}/var/lib/private/hass/"{} \;
  chmod 700 "${pkgdir}/var/lib/private"

  install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
