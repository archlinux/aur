# Maintainer: javier dot tia at gmail dot com
# Old Maintainer: onestone at gmail dot com

pkgname=ttf-input
pkgver=20170305
pkgrel=1
pkgdesc='Fonts for Code, from Font Bureau'
arch=('any')
url='http://input.fontbureau.com/'
license=('custom:Font Software License Agreement')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=()
conflicts=()
url_long="${url}build/?fontSelection=whole&a=0&g=0&i=0&l=0&zero=0&asterisk=0&braces=0&preset=default&line-height=1.2&accept=I+do&email="
source=("Input-Font.zip::${url_long}")
sha256sums=('be93f43ee012968a07d28de117c95854e7188c43340ee6811311c5168041f7b1')
install=${pkgname}.install

package() {
  mkdir -p ${pkgdir}/usr/share/fonts/TTF
  find ${srcdir}/Input_Fonts -name '*.ttf' \
    -exec cp {} ${pkgdir}/usr/share/fonts/TTF \;
  chmod 644 ${pkgdir}/usr/share/fonts/TTF/*

  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}
}
