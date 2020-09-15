# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='Natron'
pkgname="${_pkgname,,}-bin"
pkgver=2.3.15
pkgrel=1
pkgdesc='Node-graph video compositor'
arch=('x86_64')
url='https://natrongithub.github.io/'
github_url="https://github.com/${_pkgname}GitHub/${_pkgname}"
license=('GPL2')
options=('!strip')
provides=("${_pkgname,,}")
conflicts=("${_pkgname,,}")
source=("${github_url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-Linux-64-no-installer.tar.xz"
        "${_pkgname}-${pkgver}.desktop::${github_url}/raw/v${pkgver}/Gui/Resources/Applications/fr.${_pkgname,,}.${_pkgname}.desktop"
        "${_pkgname}-${pkgver}.xml::${github_url}/raw/v${pkgver}/Gui/Resources/Mime/x-${_pkgname,,}.xml")
sha256sums=('3d5dd363382dfaae52b6868ec5a2a4baa7bba1226a8c0f76201e1849d9fb8cb9'
            'a8704ec3f23b9b3e9d32b2506a193345000d68af5bcbdbf23dd419f83042e6bc'
            '73d7432d43aab21aeb7d9acce35ee69ac33657a634b4ce65bf8ee0ea1cec7df4')

package() {
  install -Dm644 "${_pkgname}-${pkgver}.desktop" "${pkgdir}/usr/share/applications/fr.${_pkgname,,}.${_pkgname}.desktop"
  install -Dm644 "${_pkgname}-${pkgver}.xml" "${pkgdir}/usr/share/mime/application/x-${_pkgname,,}.xml"
  install -d "${pkgdir}/"{"opt/${_pkgname}",'usr/bin'}
  cd "${_pkgname}-${pkgver}-Linux-64-no-installer"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "Resources/pixmaps/${_pkgname,,}Icon256_linux.png"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/mimetypes" "Resources/pixmaps/${_pkgname,,}ProjectIcon_linux.png"
  mv -f ./* "${pkgdir}/opt/${_pkgname}"
  ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim: ts=2 sw=2 et:
