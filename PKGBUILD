# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-mplus
pkgver=TESTFLIGHT_062
_pkgver=${pkgver/_/-}
pkgrel=2
pkgdesc="M+ Japanese outline fonts"
arch=('any')
url="http://mplus-fonts.osdn.jp/mplus-outline-fonts/index-en.html"
license=('custom')
depends=('fontconfig')
_mirror="jaist"
source=(http://${_mirror}.dl.osdn.jp/mplus-fonts/62344/mplus-${_pkgver}.tar.xz)
sha256sums=('0ac2b66f814129dcf327061944b6b409b6dae9e22f94f1a383d216556ddd84b8')

package() {
  cd ${srcdir}/mplus-${_pkgver}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/

  install -D -m644 LICENSE_E \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
