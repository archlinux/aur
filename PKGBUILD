# Contributor: Jorge Mokross <mokross@gmail.com>
# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-umeplus
pkgver=20161108
pkgrel=2
pkgdesc="Modified Ume and M+ fonts for Japanese"
url="http://www.geocities.jp/ep3797/modified_fonts_01.html"
license=('custom')
arch=('any')
depends=('fontconfig')
source=(http://jaist.dl.osdn.jp/users/11/11274/umeplus-fonts-${pkgver}.tar.xz)
sha256sums=('0f5d38131e000e3ca622f05198dbbd2b3ddafdba55dc8b2e76a4fab05c7178ad')

package() {
  cd ${srcdir}/umeplus-fonts-${pkgver}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF

  install -D -m644 docs-mplus/LICENSE_E \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_MPLUS.txt
  install -D -m644 docs-ume/license.html \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_UME.html
}
