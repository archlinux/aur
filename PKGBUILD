# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=amazon-fonts
pkgver=Mar2020
pkgrel=1
pkgdesc='Complete set of all Amazon fonts (Bookerly, Amazon Ember)'
arch=(any)
url='https://developer.amazon.com/en-US/alexa/branding/echo-guidelines/identity-guidelines/typography'
license=('custom:Amazon Type Library Usage Guidelines')
makedepends=(unzip)
source=("https://m.media-amazon.com/images/G/01/mobile-apps/dex/alexa/branding/Amazon_Typefaces_Complete_Font_Set_${pkgver}.zip")
sha256sums=('8b97a86c91630e4c3e6163a1ce75d35ef093037e6d0eabcb273dbd6fe5c35b11')

package() {
  cd "Amazon_Typefaces_Complete_Font_Set_${pkgver}"
  unzip '*.zip'
  install -m755 -d "${pkgdir}/usr/share/"{fonts/amazon,{doc,licenses}/${pkgname}}
  install -m644 -t "${pkgdir}/usr/share/fonts/amazon" ./*_all_*/all/*.ttf
  install -m644 -t "${pkgdir}/usr/share/fonts/amazon" ./*_jp_*/Fonts/*.otf
  install -m644 "Amazon Ember Licensing Guidelines.pdf" "${pkgdir}/usr/share/doc/${pkgname}/Amazon_Ember_Licensing_Guidelines.pdf"
  ln -s "../../doc/${pkgname}/Amazon_Ember_Licensing_Guidelines.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
