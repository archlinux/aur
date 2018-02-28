# Maintainer: Polichronucci <nick at discloud dot eu> 

pkgname=hass-configurator
pkgver=0.2.6
pkgrel=1
pkgdesc="Configuration UI for Home Assistant"
arch=('any')
url="https://github.com/danielperna84/hass-configurator"
license=('MIT')
depends=('python' 'home-assistant')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/danielperna84/hass-configurator/archive/${pkgver}.tar.gz"
        "${pkgname}.service")
sha512sums=('b2a43ce80df7baefed0071d5634b08f088492544dc508ab0870edea43f906404a42082fc75a6f96d2bbb42575d045d78c780e192e1bc5d3066c46ee61affb3b6'
            '2840d5e9023f5eabe3f2794801f7b765d31ccaf8f0352b3608da67f9effe252c4c19b56029b2b785a2bfce0c13068e787e4c646c2b62a7850bcbb9e90cc73665')

package() {
  cd "${srcdir}"

  install -m755 -D "${pkgname}-${pkgver}/configurator.py" "${pkgdir}/usr/bin/${pkgname}"
  install -m644 -D "${pkgname}-${pkgver}/settings.conf" "${pkgdir}/var/lib/hass/${pkgname}/settings.conf"
  install -m644 -D "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/hass-configurator.service"
}
