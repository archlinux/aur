# Maintainer(nov/2022): EndlessEden
#
# Previous Maintainer(2018): Polichronucci <nick at discloud dot eu> 
#

pkgname=hass-configurator
pkgver=0.5.2
pkgrel=1
pkgdesc="Configuration UI for Home Assistant"
arch=('any')
url="https://github.com/danielperna84/hass-configurator"
license=('MIT')
depends=('python' 'home-assistant')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/danielperna84/hass-configurator/archive/${pkgver}.tar.gz"
        "${pkgname}.service")
sha512sums=('53261fa76e71896212024591d671a5b06d2e3e08eb16b36a2a494e868d40aa597d6218d119b12ebd6b092e6eb9513e6fb4b9069d5519571ee1b8e4230d383219'
            '6102b199e55afc8ef1f7e3299294deb46678deb3edad2fde20f45ea7e3e2fb08eea605645cde8f3d9c9ba48558304b211e5504b573abf154053a5e5fc7eafd0f')

package() {
  cd "${srcdir}"

  install -m755 -D "${pkgname}-${pkgver}/configurator.py" "${pkgdir}/usr/bin/${pkgname}"
  install -m644 -D "${pkgname}-${pkgver}/settings.conf" "${pkgdir}/var/lib/hass/${pkgname}/settings.conf"
  install -m644 -D "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/hass-configurator.service"
}
