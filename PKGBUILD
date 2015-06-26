# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-mplus
pkgver=TESTFLIGHT_060
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="M+ Japanese outline fonts"
arch=('any')
url="http://mplus-fonts.osdn.jp/mplus-outline-fonts/index-en.html"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
_mirror="jaist" # keihanna, jaist, iij, osdn
source=(http://${_mirror}.dl.sourceforge.jp/mplus-fonts/62344/mplus-${_pkgver}.tar.xz)
md5sums=('dbaf2236aa56d8a4c01dbc14a3e5e03a')
sha256sums=('b6914650caa86b9a8cfd682ae643bfb174690513a5aa01b3d75830a6761ae753')

package() {
  cd ${srcdir}/mplus-${_pkgver}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/

  install -D -m644 LICENSE_E \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
