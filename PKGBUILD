# Maintainer: bohoomil <@zoho.com>

pkgbase=ttf-yanone-kaffeesatz-ibx
pkgname=('otf-yanone-kaffeesatz-ibx' 'ttf-yanone-kaffeesatz-ibx')
pkgver=1.002
pkgrel=5
depends=('fontconfig')
pkgdesc="Yanone Kaffeesatz was first published in 2004. Its Bold is reminiscent of 1920s coffee house typography, while the rather thin fonts bridge the gap to present times."
url="http://www.yanone.de/"
arch=('any')
license=('custom:OFL')
groups=('infinality-bundle-fonts-extra')
# https://www.fontsquirrel.com/fonts/yanone-kaffeesatz
source=(git://github.com/alexeiva/yanone-kaffeesatz.git
        45-yanone-kaffeesatz.conf
        90-non-tt-yanone-kaffeesatz.conf
        90-tt-yanone-kaffeesatz.conf)
sha1sums=('SKIP'
          '76df22b5dbc02abda1bbc6c887d848958695be9c'
          '4cc8a9806bb0718c09ccc987a981fc427671c155'
          'c83a6771a50d2b7c95e7fb872725ce430beb1bd9')

package_otf-yanone-kaffeesatz-ibx(){
  pkgdesc="Yanone Kaffeesatz was first published in 2004. Its Bold is reminiscent of 1920s coffee house typography, while the rather thin fonts bridge the gap to present times. OpenType version."
  conflicts=('otf-yanone-kaffeesatz' 'ttf-yanone-kaffeesatz-ibx' 'ttf-yanone_kaffeesatz_zerohack')
  replaces=('otf-yanone-kaffeesatz')

  cd "${srcdir}/yanone-kaffeesatz"

  install -d -m755 "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 OFL.txt "${pkgdir}"/usr/share/licenses/"${pkgname}/COPYING"

  install -d -m755 "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 fonts/otf/*.otf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  cd "${srcdir}"
  install -m755 -d "${pkgdir}"/etc/fonts/conf.avail
  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  install -m644 45-yanone-kaffeesatz.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-yanone-kaffeesatz.conf
  install -m644 90-non-tt-yanone-kaffeesatz.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-non-tt-yanone-kaffeesatz.conf

  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-yanone-kaffeesatz.conf .
  ln -s ../conf.avail/90-non-tt-yanone-kaffeesatz.conf .
}

package_ttf-yanone-kaffeesatz-ibx(){
  pkgdesc="Yanone Kaffeesatz was first published in 2004. Its Bold is reminiscent of 1920s coffee house typography, while the rather thin fonts bridge the gap to present times. TruenType version."
  conflicts=('otf-yanone-kaffeesatz' 'otf-yanone-kaffeesatz-ibx' 'ttf-yanone_kaffeesatz_zerohack')

  cd "${srcdir}/yanone-kaffeesatz"

  install -d -m755 "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 OFL.txt "${pkgdir}"/usr/share/licenses/"${pkgname}/COPYING"

  install -d -m755 "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 fonts/ttf/*.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  cd "${srcdir}"
  install -m755 -d "${pkgdir}"/etc/fonts/conf.avail
  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  install -m644 45-yanone-kaffeesatz.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-yanone-kaffeesatz.conf
  install -m644 90-tt-yanone-kaffeesatz.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-yanone-kaffeesatz.conf

  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-yanone-kaffeesatz.conf .
  ln -s ../conf.avail/90-tt-yanone-kaffeesatz.conf .
}
