# Maintainer: taskie <t at skie dot jp>
pkgname=ttf-mgenplus
pkgver=20150602
pkgrel=2
pkgdesc='Mgen+ Japanese outline fonts (M+ + Noto CJK)'
arch=('any')
url='http://jikasei.me/font/mgenplus/'
license=('custom:SIL')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
_mirror='jaist' # keihanna, jaist, iij, osdn
source=(http://${_mirror}.dl.osdn.jp/users/8/8597/mgenplus-${pkgver}.7z)
md5sums=('0a898d1766cf9c099dd3b8f27abe9799')

package() {
  cd "$srcdir"

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/

  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -D -m644 SIL_Open_Font_License_1.1.txt \
          ${pkgdir}/usr/share/licenses/${pkgname}/
}
