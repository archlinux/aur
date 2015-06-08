# Contributor: Jorge Mokross <mokross@gmail.com>
# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-umeplus
pkgver=20150115
pkgrel=1
pkgdesc="Modified Ume and M+ fonts for Japanese"
url="http://www.geocities.jp/ep3797/modified_fonts_01.html"
license=('custom')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://downloads.sourceforge.net/mdk-ut/umeplus-fonts-${pkgver}.tar.lzma)
md5sums=('bac6afe82549015be4b8c91d8401c9db')
sha256sums=('032952bfe8fe5dceea354005bcac0a8c27116d222a4878fe9701f67cf4571e54')

package() {
  cd ${srcdir}/umeplus-fonts-${pkgver}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF

  install -D -m644 docs-mplus/LICENSE_E \
    ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_MPLUS.txt
  install -D -m644 docs-ume/license.html \
    ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_UME.html
}
