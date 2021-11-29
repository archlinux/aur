# Maintainer: Harry Beadle <harrybeadle@protonmail.com>

pkgname=otf-new-york
pkgver=1
pkgrel=6
pkgdesc='Apple-designed serif typeface based on essential aspects of historical type styles.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom')
makedepends=('p7zip')
source=('NY-Font.dmg::https://devimages-cdn.apple.com/design/resources/download/NY.dmg')
sha512sums=('1dca55f41f9a3bd5db605d6262d530b5a008c945c65bdf5a4d55b89ae7a0a63d80cef4c2b3ac5b39cb0929d023af93dffaa935bf81b51eee9e8972dd302e5c47')

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
