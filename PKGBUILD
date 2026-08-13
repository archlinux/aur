# Maintainer: restitux <restitux@ohea.xyz>

_pkgname=pyscript
pkgname=home-assistant-pyscript
pkgver=2.1.0
pkgrel=1
pkgdesc="Pyscript adds rich Python scripting to HASS"
arch=(any)
url="https://github.com/custom-components/pyscript"
license=("Apache-2.0")
depends=("home-assistant")
source=("$pkgname-$pkgver.tar.gz::https://github.com/custom-components/pyscript/archive/${pkgver}.tar.gz")
b2sums=('3603db95fc9ff9ff8f2dbf964fa843dd5b7893abeaf52c95b4c7d3237d9e8e056bbf0ee980bfb8297e01ae1a828e218b8633cfe7b2673671b6325c695db72769')

package() {
  cd "$_pkgname-$pkgver"

  find "custom_components/pyscript" -type f -exec install -vDm 644 {} "${pkgdir}/var/lib/private/hass/"{} \;
  chmod 700 "${pkgdir}/var/lib/private"

  install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
