# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-mplus
pkgver=TESTFLIGHT_061
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="M+ Japanese outline fonts"
arch=('any')
url="http://mplus-fonts.osdn.jp/mplus-outline-fonts/index-en.html"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
_mirror="jaist" # keihanna, jaist, iij, osdn
source=(http://${_mirror}.dl.osdn.jp/mplus-fonts/62344/mplus-${_pkgver}.tar.xz)
sha256sums=('0f8983267ae274b5c47d17db4aca193dfce3558c6561aa6e95c9212f68313bfb')

package() {
  cd ${srcdir}/mplus-${_pkgver}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/

  install -D -m644 LICENSE_E \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
