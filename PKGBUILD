# Contributor: Jorge Mokross <mokross@gmail.com>
# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-umeplus
pkgver=20150917
pkgrel=1
pkgdesc="Modified Ume and M+ fonts for Japanese"
url="http://www.geocities.jp/ep3797/modified_fonts_01.html"
license=('custom')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://jaist.dl.osdn.jp/users/9/9098/umeplus-fonts-${pkgver}.tar.xz)
md5sums=('6fef030d44d4697b6be54da6958e0848')
sha256sums=('2c7b0597dde12318a60d4e3f5173debc171782ccc34f0e826c700dfd41b33af4')

package() {
  cd ${srcdir}/umeplus-fonts-${pkgver}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF

  install -D -m644 docs-mplus/LICENSE_E \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_MPLUS.txt
  install -D -m644 docs-ume/license.html \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_UME.html
}
