# Maintainer: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >

_fontname=bitter
pkgname=otf-${_fontname}
pkgver=1
pkgrel=2
pkgdesc='A font specially designed for comfortably reading on any computer or device.'
arch=('any')
url="http://www.huertatipografica.com/fonts/${_fontname}-ht"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
conflicts=('otf-google-fonts-hg')
install="${pkgname}.install"
source=("${_fontname}.zip::http://www.fontsquirrel.com/fonts/download/${_fontname}")
md5sums=('SKIP')

package() {
  cd "${srcdir}"
  unzip -qqo "${_fontname}.zip"

  install -Dm644 "SIL Open Font License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/OFL"
  install -d "${pkgdir}/usr/share/fonts/OTF/"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF/"
}
