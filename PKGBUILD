# Maintainer: Sam Whited <sam@samwhited.com>

_fnt_name=public-sans
pkgname=ttf-${_fnt_name}
pkgver=1.008
pkgrel=1
pkgdesc="A strong, neutral typeface for text or display."
arch=('any')
url="https://public-sans.digital.gov/"
license=('custom:OFL')
source=("$pkgname-$pkgver.zip::https://github.com/uswds/${_fnt_name}/releases/download/v${pkgver}/${_fnt_name}-v${pkgver}.zip"
        https://raw.githubusercontent.com/uswds/public-sans/master/LICENSE.md
        https://raw.githubusercontent.com/impallari/Libre-Franklin/master/OFL.txt)
sha256sums=('12c5880048ad3f62f8b6f868142cb8b694029a037b6886788ce587babe026874'
            '00acc4a89658f2c26f17d608f37f909ad087ade21b02759f4c221526371cf9eb'
            'ea80c9fcfc279cc306910cf5a21133320276ced31d3929e3c025519f3ed28b50')

package() {
  install -d ${pkgdir}/usr/share/fonts/OTF
  install -d ${pkgdir}/usr/share/fonts/TTF
  install -Dm644 ${srcdir}/binaries/otf/*.otf ${pkgdir}/usr/share/fonts/OTF/
  install -Dm644 ${srcdir}/binaries/webfonts/*.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -Dm644 ${srcdir}/binaries/variable/*.ttf ${pkgdir}/usr/share/fonts/TTF/

  install -Dm644 ${srcdir}/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
  install -Dm644 ${srcdir}/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
