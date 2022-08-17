# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=amazon-fonts
pkgver=Mar2020
pkgrel=2
pkgdesc='Complete set of all Amazon fonts (Bookerly, Amazon Ember)'
arch=(any)
url='https://developer.amazon.com/en-US/alexa/branding/echo-guidelines/identity-guidelines/typography'
license=('custom:Amazon Type Library Usage Guidelines')
makedepends=(unzip)
source=("https://m.media-amazon.com/images/G/01/mobile-apps/dex/alexa/branding/Amazon_Typefaces_Complete_Font_Set_${pkgver}.zip")
sha256sums=('7d41839edb43b49acb8409604f88c26f3e1b7c642fb712ff04ec62c951e88cd9')

package() {
  cd "Amazon_Typefaces_Complete_Font_Set_${pkgver}"
  unzip 'amazon_typography_all.zip'
  install -m755 -d "${pkgdir}/usr/share/"{fonts/amazon,{doc,licenses}/${pkgname}}
  install -m644 -t "${pkgdir}/usr/share/fonts/amazon" ./*_all_*/all/*.ttf
  install -m644 -t "${pkgdir}/usr/share/fonts/amazon" ./Bookerly/Bookerly-*.ttf
  install -m644 "Amazon Ember Licensing Guidelines.pdf" "${pkgdir}/usr/share/doc/${pkgname}/Amazon_Ember_Licensing_Guidelines.pdf"
  ln -s "../../doc/${pkgname}/Amazon_Ember_Licensing_Guidelines.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
