# Maintainer: Sam Whited <sam@samwhited.com>

_fnt_name=public-sans
pkgname=ttf-${_fnt_name}
pkgver=1.0.0
pkgrel=1
pkgdesc="A strong, neutral typeface for text or display."
arch=('any')
url="https://public-sans.digital.gov/"
license=('custom:OFL')
source=("$pkgname-$pkgver.zip::https://github.com/uswds/${_fnt_name}/releases/download/v${pkgver}/${_fnt_name}-v${pkgver}.zip"
        https://raw.githubusercontent.com/uswds/public-sans/master/ofl.txt)
sha256sums=('f2ae81c5e3949e867957abac962588fece769bba04e34eb2328a7a1962034fba'
            'a24aca924da18c40798440bd9e97ef0a78868f7f7c5d1ca9c709a29a4e220087')

package() {
  install -d ${pkgdir}/usr/share/fonts/OTF
  install -d ${pkgdir}/usr/share/fonts/TTF
  install -Dm644 ${srcdir}/${_fnt_name}-v${pkgver}/fonts/otf/*.otf ${pkgdir}/usr/share/fonts/OTF/
  install -Dm644 ${srcdir}/${_fnt_name}-v${pkgver}/fonts/webfonts/*.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -Dm644 ${srcdir}/${_fnt_name}-v${pkgver}/fonts/variable/*.ttf ${pkgdir}/usr/share/fonts/TTF/

  install -Dm644 ${srcdir}/ofl.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
