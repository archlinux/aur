# Maintainer: Harry Beadle <harrybeadle@protonmail.com>

pkgname=otf-new-york
pkgver=1
pkgrel=2
pkgdesc='Apple-designed serif typeface based on essential aspects of historical type styles.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom')
makedepends=('p7zip')
source=('https://developer.apple.com/design/downloads/NY-Font.dmg')
md5sums=('59e9c38d6e75e97ef3558b99f0928b29')

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

