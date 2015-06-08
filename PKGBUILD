# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-mplus
pkgver=TESTFLIGHT_059
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="M+ Japanese outline fonts"
arch=('any')
url="http://mplus-fonts.sourceforge.jp/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
_mirror="jaist" # keihanna, jaist, iij, osdn
source=(http://${_mirror}.dl.sourceforge.jp/mplus-fonts/62344/mplus-${_pkgver}.tar.xz)
md5sums=('2e154630ce38cc48ea3e290c5f68c2d7')
sha256sums=('7862e113e04986646117267c4baee30aea163d43a382c14693f15287f16bbf25')

package() {
  cd ${srcdir}/mplus-${_pkgver}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/

  install -D -m644 LICENSE_E \
    ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
