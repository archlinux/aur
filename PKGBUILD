# Maintainer: Polichronucci <nick at discloud dot eu> 

pkgname=hass-configurator
pkgver=0.2.6
pkgrel=2
pkgdesc="Configuration UI for Home Assistant"
arch=('any')
url="https://github.com/danielperna84/hass-configurator"
license=('MIT')
depends=('python' 'home-assistant')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/danielperna84/hass-configurator/archive/${pkgver}.tar.gz"
        "${pkgname}.service")
sha512sums=('b2a43ce80df7baefed0071d5634b08f088492544dc508ab0870edea43f906404a42082fc75a6f96d2bbb42575d045d78c780e192e1bc5d3066c46ee61affb3b6'
            '6102b199e55afc8ef1f7e3299294deb46678deb3edad2fde20f45ea7e3e2fb08eea605645cde8f3d9c9ba48558304b211e5504b573abf154053a5e5fc7eafd0f')

package() {
  cd "${srcdir}"

  install -m755 -D "${pkgname}-${pkgver}/configurator.py" "${pkgdir}/usr/bin/${pkgname}"
  install -m644 -D "${pkgname}-${pkgver}/settings.conf" "${pkgdir}/var/lib/hass/${pkgname}/settings.conf"
  install -m644 -D "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/hass-configurator.service"
}
