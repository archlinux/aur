# Maintainer: Roelof Ridderman <roelof@ridderman.nl>
pkgname=parsehub
pkgver=2.4.41
pkgrel=1
pkgdesc="A free web scraper that is easy to use"
appimage=ParseHub.AppImage
arch=('x86_64')
options=(!strip)
url="https://www.parsehub.com/"
license=('custom: https://www.parsehub.com/terms')
source=("${appimage}::https://www.parsehub.com/static/client/${appimage}"
        "${pkgname}.desktop"
        "${pkgname}.png")
sha256sums=('f63df34973b9f731136f5609dca46cb7f4945b3f89eeeaa2067839dc08c4b719'
            '18cf2c810aa2ac96a59e53553282caa38ff52bba1c1b5b6477827a777167bf45'
            '32eb295845efbcbc888b399590d3eecafd7c6d66a6e70c7b560b305b71c1111b')
noextract=("${appimage}")
package() {
  install -D -m755 "${srcdir}/${appimage}" "${pkgdir}/opt/${pkgname}/${appimage}"

  # Add the icon and desktop file
  install -D -m644 "${pkgname}.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
  install -D -m644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
