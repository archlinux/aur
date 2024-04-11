# Maintainer: Roelof Ridderman <kavaliros@ridderman.nl>
pkgname=parsehub
pkgver=2.4.29
pkgrel=1
pkgdesc="A free web scraper that is easy to use "
arch=('x86_64')
url="https://www.parsehub.com/"
license=('custom: https://www.parsehub.com/terms')
source=("https://www.parsehub.com/static/client/ParseHub.AppImage"
        "${pkgname}.desktop"
        "${pkgname}.png")
sha256sums=('caef3d16efe49cd49ff0a0311a4eeef69b7c2878299c3cfd335fe97020a4e0bb'
            '18cf2c810aa2ac96a59e53553282caa38ff52bba1c1b5b6477827a777167bf45'
            '32eb295845efbcbc888b399590d3eecafd7c6d66a6e70c7b560b305b71c1111b')

package() {
  install -d "$/opt/${pkgname}"
  cp -a "${pkgname}/"* "$/opt/${pkgname}"

  # Add the icon and desktop file
  install -D -m644 "${pkgname}.png" "$/usr/share/icons/${pkgname}.png"
  install -D -m644 "${pkgname}.desktop" "$/usr/share/applications/${pkgname}.desktop"
}
