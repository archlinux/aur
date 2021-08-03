# Maintainer: Harry Beadle <harrybeadle@protonmail.com>

pkgname=otf-new-york
pkgver=1
pkgrel=4
pkgdesc='Apple-designed serif typeface based on essential aspects of historical type styles.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom')
makedepends=('p7zip')
source=('NY-Font.dmg::https://devimages-cdn.apple.com/design/resources/download/NY.dmg')
sha512sums=('951381ba04028987d77a7d13c6b5020b72b538bc40ac9513f9fce1223af1417f3eda6bd161ce1bdf59e2f0b831d649412d5a9f0b1d810c860c46b011a1feaa32')

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
