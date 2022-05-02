# Maintainer: Harry Beadle <harrybeadle@protonmail.com>

pkgname=otf-new-york
pkgver=1
pkgrel=7
pkgdesc='Apple-designed serif typeface based on essential aspects of historical type styles.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom')
makedepends=('p7zip')
source=('NY-Font.dmg::https://devimages-cdn.apple.com/design/resources/download/NY.dmg')
sha512sums=('e7773bf92e045a1fbdae68ad9fc129ef6d7719ab4ba50ab27bc6887ac35839966c52baed0e1ce711dc387456563f87931440760640f259c32eedd35530fb4749')

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
