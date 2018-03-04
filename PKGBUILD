# Maintainer: Alexandre Macabies <web+oss@zopieux.com>
pkgname=rofi-twitch
pkgver=1.0.0
pkgrel=1
pkgdesc="rofi-based launcher for Twitch streams"
arch=('any')
license=('MIT')
depends=('rofi'
         'streamlink'
         'python-requests')
source=("${pkgname}"
        "${pkgname}.desktop"
        "${pkgname}.png")
sha1sums=('30fd3bb07d37917d7d9d2f1709344525d91801e3'
          '97bafd654648421e7437d7ee113e5411e5f79212'
          'ca4eeea9f1b3671fe231853639672bffa9be7d82')
options=(!strip)

package() {
  cd "${srcdir}"
  install -Dm755 "${srcdir}/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
