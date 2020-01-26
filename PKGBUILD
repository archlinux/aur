# Maintainer: neo2001 <neo2001 at posteo dot net>

pkgname=blheli-configurator-bin
_pkgname=blheli-configurator
pkgver=1.2.0
pkgrel=1
pkgdesc="Crossplatform configuration tool for BLHeli based ESCs"
arch=('x86_64')
url="https://github.com/blheli-configurator/blheli-configurator"
source=("https://github.com/blheli-configurator/blheli-configurator/releases/download/${pkgver}/BLHeli-Configurator_linux64_${pkgver}.zip"
        "https://raw.githubusercontent.com/blheli-configurator/blheli-configurator/master/images/icon_128.png"
        "https://raw.githubusercontent.com/blheli-configurator/blheli-configurator/master/LICENSE"
        "blheli-configurator.desktop")

sha256sums=('6a9b019113afd8901310e7e94fb3e3af637e89d2b6109a4a4501512c9cecded3'
            '0f806054053cf4dbb6204edd6457f868a53e8871047f5b0cc59e7e814994b182'
            '589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2'
            '2bc56da58c65a897149e70720e76bff080ffa99d847b283f516ae9f3130ccbd1')

install="${pkgname}.install"
options=(!strip)
license=('GPL3')
provides=('blheli-configurator')
conflicts=('blheli-configurator')

package() {
  mkdir -p "${pkgdir}/opt/blheli-configurator"
  mkdir -p "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${srcdir}/blheli-configurator.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/icon_128.png" "${pkgdir}/opt/blheli-configurator/blheli_icon_128.png"
  cp -r --preserve=all "${srcdir}/BLHeli Configurator/." "${pkgdir}/opt/blheli-configurator"
  ln -s "/opt/blheli-configurator/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
