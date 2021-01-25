# Maintainer: Harry Beadle <harrybeadle@protonmail.com>

pkgname=otf-new-york
pkgver=1
pkgrel=3
pkgdesc='Apple-designed serif typeface based on essential aspects of historical type styles.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom')
makedepends=('p7zip')
source=('https://developer.apple.com/design/downloads/NY-Font.dmg')
md5sums=('e7094567550d3a07365bc11c0c87bcbe')

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
