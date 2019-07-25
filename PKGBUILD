# Maintainer: Harry Beadle <harrybeadle@protonmail.com>

pkgname=otf-new-york
pkgver=1
pkgrel=1
pkgdesc='This all-new, Apple-designed serif typeface is based on essential aspects of historical type styles and is designed to work on its own as well as alongside San Francisco.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom')
makedepends=('p7zip' 'dmg2img')
source=('https://developer.apple.com/design/downloads/NY-Font.dmg')
md5sums=('a64538ebe8130ecf9011c3bde96054c0')

prepare() {
  dmg2img NY-Font.dmg NY-Font.img
  7z x NY-Font.img
}

package() {
  cd 'NY-Font/New York/'
  install -d "${pkgdir}"/usr/share/fonts/apple
  install -m644 *.otf "${pkgdir}"/usr/share/fonts/apple/
}

