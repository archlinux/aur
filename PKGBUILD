# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=hass-circadian_lighting
pkgname=home-assistant-circadian_lighting
pkgver=2.1.3
pkgrel=1
pkgdesc="Custom component for Home Assistant, to adjust lights based on daylight"
arch=(any)
url="https://github.com/claytonjn/hass-circadian_lighting"
license=("Apache-2.0")
depends=("home-assistant")
source=("$pkgname-$pkgver::https://github.com/claytonjn/hass-circadian_lighting/archive/${pkgver}.tar.gz")
sha512sums=('26abb520ccf7674cba021b350294107524eeeca13768c0a57b25553e13c92a3d75fe99108f0fd19ec4d1f4a78ae1bb068e61c35aba22bcbc7b021dfa04f15210')


package() {
    cd "$_pkgname-$pkgver"

    find "custom_components" -type f -exec install -vDm 644 {} "${pkgdir}/var/lib/private/hass/"{} \;

    install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
