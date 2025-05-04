# Maintainer: Relish0171 <aur.such581@aleeas.com>
_basename=trios
pkgname=${_basename}-bin
pkgver=1.1.9
pkgrel=1
pkgdesc="Starsector mod manager & toolkit."
arch=('x86_64')
url="https://github.com/wispborne/TriOS"
license=('GPL3')
depends=()
optdepends=('starsector')
source=("https://github.com/wispborne/TriOS/releases/download/${pkgver}/TriOS-Linux.zip"
    "${_basename}.desktop")
sha256sums=('d92ee917795a1b5a06a8c880df9a9790e1ce64432529ff5bbcf8c08bd605ccce'
    'a34536873f548821d7d91f192029114470f066fbac5aeb5854ad36bc2ed91f24')

package() {
    install -Dm644 "${srcdir}/${_basename}.desktop" "${pkgdir}/usr/share/applications/${_basename}.desktop"

    install -Dm644 "${srcdir}/TriOS/data/flutter_assets/assets/images/telos_faction_crest.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_basename}.png"
    install -Dm644 "${srcdir}/TriOS/data/flutter_assets/assets/images/telos_faction_crest.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_basename}.svg"

    install -Dm755 "${srcdir}/TriOS/TriOS" "${pkgdir}/opt/${pkgname}/TriOS"

    cp -r "${srcdir}/TriOS/data" "${pkgdir}/opt/${pkgname}/"
    cp -r "${srcdir}/TriOS/lib" "${pkgdir}/opt/${pkgname}/"

    install -dm755 "${pkgdir}/usr/bin/"
    ln -s "/opt/${pkgname}/TriOS" "${pkgdir}/usr/bin/TriOS"
}
