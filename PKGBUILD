# Maintainer: Harry Beadle <harrybeadle@protonmail.com>

pkgname=otf-new-york
pkgver=1
pkgrel=5
pkgdesc='Apple-designed serif typeface based on essential aspects of historical type styles.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom')
makedepends=('p7zip')
source=('NY-Font.dmg::https://devimages-cdn.apple.com/design/resources/download/NY.dmg')
sha512sums=('c9729d6274851589306cd4d35fd16657126e6245cfbf4a30328021c703f347263ad2f3e48493fdf08e3838372397dbfd0ec6710c1772ce8387ea7d8b83e9020c')

prepare() {
  7z x NY-Font.dmg
  7z x "NYFonts/NY Fonts.pkg"
  7z x "Payload~"
}

package() {
  cd 'Library/Fonts/'
  install -d "${pkgdir}"/usr/share/fonts/apple
  install -m644 *.otf "${pkgdir}"/usr/share/fonts/apple/
}
