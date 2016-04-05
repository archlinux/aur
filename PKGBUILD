# Contributor: Jorge Mokross <mokross@gmail.com>
# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-umeplus
pkgver=20160402
pkgrel=1
pkgdesc="Modified Ume and M+ fonts for Japanese"
url="http://www.geocities.jp/ep3797/modified_fonts_01.html"
license=('custom')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://jaist.dl.osdn.jp/users/10/10368/umeplus-fonts-${pkgver}.tar.xz)
sha256sums=('4838485a46a5c22e6efce01c52c2fbe61fa0bd62698c735f168f8bff25d79d06')

package() {
  cd ${srcdir}/umeplus-fonts-${pkgver}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF

  install -D -m644 docs-mplus/LICENSE_E \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_MPLUS.txt
  install -D -m644 docs-ume/license.html \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_UME.html
}
