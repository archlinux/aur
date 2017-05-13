# Based on original katawa-shoujo PKGBUILD (but use native renpy instead of bundled one) written by Anton Larionov <diffident dot cat at gmail dot com>
# Maintainer: emersion < contact at emersion dot fr >

pkgname=ks-summersclover
pkgver=1.2
pkgrel=1
pkgdesc="Katawa Shoujo: Summer's Clover"
arch=('any')
url='https://github.com/stanriders/ks-summersclover'
depends=('renpy')
source=("https://github.com/stanriders/${pkgname}/releases/download/v${pkgver}/ks-summersclover-v12-release.zip"
        "${pkgname}"
        "${pkgname}.desktop"
        "${pkgname}.png"
        )

md5sums=('204b90bad52a3ab344448ac5c3ad055e'
         'a290d47ed9403fd0ee10bcc54c590631'
         'abe7dfe73761d3880b0167c23daa4ac8'
         '6d70e339e33d7c13a8ab03a5d3498c4f'
         )

package() {
  # copy main files
  cd "${srcdir}"
  install -dm755  "${pkgdir}/usr/share/${pkgname}"
  cp -r game archived "${pkgdir}/usr/share/${pkgname}"

  # copy bash script
  install -D -m755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # install desktop entry file
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
