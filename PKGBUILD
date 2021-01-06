# Maintainer: Roelof Ridderman <kavaliros@ridderman.nl>
pkgname=parsehub
pkgver=latest
pkgrel=2
pkgdesc="A free web scraper that is easy to use "
arch=('x86_64')
url="https://www.parsehub.com/"
license=('custom: https://www.parsehub.com/terms')
source=("https://parsehub.com/static/client/parsehub.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.png")
sha256sums=('a7e67e39049e70f6762736e3b9fff7c462bc5ca5e6b3af22c3b02838235a34f6'
            'c3f888139be468e31af62d1f606ee3b1f681dcac77710ff318dbdd051e969aa6'
            '32eb295845efbcbc888b399590d3eecafd7c6d66a6e70c7b560b305b71c1111b')

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -a "${pkgname}/"* "${pkgdir}/opt/${pkgname}"

  # Symlink the startup script in /usr/local/bin
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Add the icon and desktop file
  install -D -m644 "${pkgname}.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
  install -D -m644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
