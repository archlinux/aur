# Based on original katawa-shoujo PKGBUILD (but use native renpy instead of bundled one) written by Cravix < dr dot neemous at gmail dot com >
# Maintainer: seigneurfuo < seigneurfuo at protonmail dot com >

pkgname=meiji-wa-yuri
pkgver=1.0
pkgrel=1
pkgdesc="A french visual novel by the Ezo2 community built with Renpy"
arch=('any')
url='https://vn.ezo2.eu/meiji_wa_yuri/'
license=('')
depends=()
#install="${pkgname}.install"
source=("meiji-wa-yuri.zip::https://github.com/shobu13/Meiji/archive/master.zip"
        "${pkgname}"
        "${pkgname}.desktop"
        "${pkgname}.png")

md5sums=('e7b420a9a510231a9aae1a79eb2f7d36'
         'a2b57af23e353d9e0e4ba0662e7a5354'
         'c5092a15acf7c42ab338e5923d61c9c8'
         '2f21b1a2f86de673a98f54f1e601a7f5')

package() {
  echo ""
  # copy main files
  cd "${srcdir}/Meiji-master/"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cp -r game "${pkgdir}/usr/share/${pkgname}"

  # copy game manual
  # install -D -m644 'Game Manual.pdf' "${pkgdir}/usr/share/doc/${pkgname}/gamemanual.pdf"

  # copy license
  #install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # copy bash script
  install -D -m755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # install desktop entry file
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

# vim:set ts=2 sw=2 et:
