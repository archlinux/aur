# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='Insomnia'
pkgname="${_pkgname,,}-bin"
pkgver=2020.4.1
pkgrel=1
pkgdesc='API Client and Design Platform for GraphQL and REST'
arch=('x86_64')
url='https://github.com/Kong/insomnia'
license=('MIT')
depends=('libappindicator-gtk3' 'libnotify' 'libsecret' 'libxss' 'libxslt' 'nodejs' 'nss' 'xdg-utils')
options=('!strip')
provides=("${_pkgname,,}")
conflicts=("${_pkgname,,}")
source=("${url}/releases/download/core@${pkgver}/${_pkgname}.Core-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}-LICENSE::${url}/raw/master/LICENSE"
        "${_pkgname,,}.desktop"
        "${_pkgname,,}.png")
sha256sums=('6b97e636fcd807d8237405b5254ab71e56eaff97a4e0ce22eb67091a25999a3c'
            'SKIP'
            '5f4b67e7f7fa1fd1876a1cc2ce69212b5059bf2c197a2564e0df81be71d1c15a'
            '37a4aa8ec36bad3894f7ac2b5e5f4630bdfb7a5a9fbd97613259b1cb07100549')

package() {
  install -d "${pkgdir}/"{'opt','usr/bin'}
  mv -f "${_pkgname}.Core-${pkgver}" "${pkgdir}/opt/${_pkgname}"
  ln -sf "/opt/${_pkgname}/${_pkgname,,}" "${pkgdir}/usr/bin/${_pkgname,,}"
  install -Dm644 -t "${pkgdir}/usr/share/applications" "${_pkgname,,}.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/512x512/apps" "${_pkgname,,}.png"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" "${pkgdir}/opt/${_pkgname}/"{'LICENSE.electron.txt','LICENSES.chromium.html'}
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
