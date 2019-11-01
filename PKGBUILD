# Maintainer: javier dot tia at gmail dot com
# Old Maintainer: onestone at gmail dot com

pkgname=ttf-input
pkgver=20191031
pkgrel=1
pkgdesc='Fonts for Code, from Font Bureau'
arch=('any')
url='http://input.fontbureau.com/'
license=('custom:Font Software License Agreement')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
url_long="${url}build/?fontSelection=whole&a=0&g=0&i=0&l=0&zero=0&asterisk=0&braces=0&preset=default&line-height=1.2&accept=I+do&email="
source=("Input_Fonts_${pkgver}.zip::${url_long}")
sha256sums=('6bdc29a3d727147041689ab52bf73c315dbecaa6e5393f8f662dfe7d94e82a83')

package() {
  mkdir -p ${pkgdir}/usr/share/fonts/TTF
  find ${srcdir}/Input_Fonts -name '*.ttf' \
    -exec cp {} ${pkgdir}/usr/share/fonts/TTF \;
  chmod 644 ${pkgdir}/usr/share/fonts/TTF/*

  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}
}
