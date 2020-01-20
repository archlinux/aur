# Maintainer: neo2001 <neo2001 at posteo dot net>

pkgname=jesc-configurator-bin
_pkgname=jesc-configurator
pkgver=1.2.6
pkgrel=1
pkgdesc="Application for JESC BLHeli firmware flashing and configuration."
arch=('x86_64')
url="https://github.com/jflight-public/jesc-configurator"
source=(
"https://github.com/jflight-public/jesc-configurator/releases/download/v${pkgver}/JESC-Configurator_linux64_${pkgver}.zip"
"https://raw.githubusercontent.com/jflight-public/jesc-configurator/master/images/icon_128.png"
"https://raw.githubusercontent.com/jflight-public/jesc-configurator/master/LICENSE"
"jesc-configurator.desktop"
)

sha256sums=('1620f6d932570f7ac333a8478501cf8af4204e0674c906110bec1be73f8cfc49'
            '0356279bd144225c42ad1605b02913ea013762d3de19e78e27281f966e4da947'
            '589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2'
            '507f26e8e54f6097e43a9b9cb6de6d231393a4ce18308745a29e1a605ac77ec7')

install="${_pkgname}.install"
options=(!strip)
license=('GPL3')
#conflicts=('jesc-configurator')

package() {
  mkdir -p "${pkgdir}/opt/${_pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${srcdir}/jesc-configurator.desktop" "${pkgdir}/usr/share/applications/jesc-configurator.desktop"
  install -Dm644 "${srcdir}/icon_128.png" "${pkgdir}/opt/${_pkgname}/jesc_icon_128.png"
  cp -r --preserve=all "${srcdir}/JESC Configurator/." "${pkgdir}/opt/${_pkgname}/"
  ln -s "/opt/${_pkgname}/jesc-configurator" "${pkgdir}/usr/bin/jesc-configurator"
}
