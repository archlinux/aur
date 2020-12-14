# Maintainer: Isai Alcântara <isfalcantara[at]gmail[dot]com>
# Maintainer: Sam Whited <sam@samwhited.com>

_reponame=public-sans
pkgname=(otf-${_reponame} ttf-${_reponame} ttf-${_reponame}-variable)
pkgver=1.008
pkgbase=${_reponame}-font
pkgrel=2
pkgdesc='A strong, neutral typeface for interfaces, text, and headings.'
arch=('any')
url="https://public-sans.digital.gov/"
license=('custom:OFL')
source=("$pkgbase-$pkgver.zip::https://github.com/uswds/${_reponame}/releases/download/v${pkgver}/${_reponame}-v${pkgver}.zip"
        "https://raw.githubusercontent.com/uswds/public-sans/v${pkgver}/LICENSE.md")
sha256sums=('12c5880048ad3f62f8b6f868142cb8b694029a037b6886788ce587babe026874'
            '00acc4a89658f2c26f17d608f37f909ad087ade21b02759f4c221526371cf9eb')

package_otf-public-sans() {
  pkgdesc+=' (OTF fonts)'
  install -d ${pkgdir}/usr/share/fonts/${_reponame}
  install -Dm644 ${srcdir}/binaries/otf/*.otf ${pkgdir}/usr/share/fonts/${_reponame}
  install -Dm644 ${srcdir}/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}

package_ttf-public-sans() {
  pkgdesc+=' (TTF fonts)'
  install -d ${pkgdir}/usr/share/fonts/${_reponame}
  install -Dm644 ${srcdir}/binaries/webfonts/*.ttf ${pkgdir}/usr/share/fonts/${_reponame}
  install -Dm644 ${srcdir}/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}

package_ttf-public-sans-variable () {
  pkgdesc+=' (unstable variable version)'
  install -d ${pkgdir}/usr/share/fonts/${_reponame}
  install -Dm644 ${srcdir}/binaries/variable/*.ttf ${pkgdir}/usr/share/fonts/${_reponame}
  install -Dm644 ${srcdir}/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
