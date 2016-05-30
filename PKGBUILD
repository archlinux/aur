# Maintainer: taskie <t@skie.jp>
# this package is based on ttf-mplus
pkgname=ttf-mgenplus
pkgver=20150602
pkgrel=1
pkgdesc='Mgen+ Japanese outline fonts (M+ + Noto CJK)'
arch=('any')
url='http://jikasei.me/font/mgenplus/'
license=('custom:SIL')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('p7zip')
install=ttf.install
_mirror='jaist' # keihanna, jaist, iij, osdn
source=(http://${_mirror}.dl.osdn.jp/users/8/8597/mgenplus-${pkgver}.7z)
noextract=(mgenplus-${pkgver}.7z)
md5sums=('0a898d1766cf9c099dd3b8f27abe9799')

prepare() {
  7za e "$noextract" -omgenplus-${pkgver}
}

package() {
  cd ${srcdir}/mgenplus-${pkgver}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/

  install -D -m644 LICENSE_E \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
