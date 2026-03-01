# Maintainer: Sovereign <contact@sovrulez.net>
pkgname=ecliypse-bin
_pkgname=ecliypse
pkgver=2.0.0
pkgrel=1
pkgdesc="High-performance game launcher and downloader"
arch=('x86_64')
url="https://ecliypse.com"
license=('custom:commercial')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libsecret' 'hicolor-icon-theme')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')

source=("${_pkgname}.desktop"
        "${_pkgname}.nvidia.desktop"
        "https://s3.lillianne.solutions/aur/${_pkgname}-${pkgver}.tar.gz")

sha256sums=('dbbc0b51d73513b148805a1bb682100efcb17b423656bebcff7e3df2283e9077'
            '498e41f8beeccee357b451afa50d529c5726da882d38e2b4b5610aa4afd8257b'
            'd085cb10c8a09463aea3669ddd2558353ddf5b0cbbc62730dd9b29fad4f62772')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${_pkgname}.nvidia.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.nvidia.desktop"
}
