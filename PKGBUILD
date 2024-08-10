# Maintainer: unit73e <unit73e@gmail.com>
# Contributor: Jorge Mokross <mokross@gmail.com>
# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-umeplus
pkgver=20180604
pkgrel=3
pkgdesc="Modified Ume and M+ fonts for Japanese"
url="https://github.com/utuhiro78/modified-fonts"
license=('custom')
arch=('any')
depends=('fontconfig' 'xorg-mkfontscale')
source=(https://github.com/utuhiro78/modified-fonts/raw/main/umeplus-fonts-${pkgver}.tar.xz)
md5sums=('43f5864d9035706f8320849e7011d6e7')
b2sums=('5b0f2677fca36a59886f389189256c78276fef8a93215090505431aa22df220e0837ee230126d4ccc019c8c252a422406e80413aa38a7a775797a24c4f88cd96')

package() {
  cd ${srcdir}/umeplus-fonts-${pkgver}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF

  install -D -m644 docs-mplus/LICENSE_E \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_MPLUS.txt
  install -D -m644 docs-ume/license.html \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_UME.html
}
