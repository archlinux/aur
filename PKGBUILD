# Maintainer: Harry Beadle <harrybeadle@protonmail.com>

pkgname=otf-san-francisco-pro
pkgver=1
pkgrel=1
pkgdesc='This sans-serif typeface is the system font for iOS, macOS, and tvOS, and includes a rounded variant. It provides a consistent, legible, and friendly typographic voice.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('p7zip' 'dmg2img')
source=('https://developer.apple.com/design/downloads/SF-Font-Pro.dmg')
md5sums=('5e8f0a64534d95db546b052c5363b273')

prepare() {
  dmg2img SF-Font-Pro.dmg SF-Font-Pro.img
  7z x SF-Font-Pro.img
}

package() {
  cd 'SF-Font-Pro/San Francisco Pro/'
  install -d "${pkgdir}"/usr/share/fonts/apple/
  install -m644 *.otf "${pkgdir}"/usr/share/fonts/apple/
  install -d "${pkgdir}"/usr/share/licenses/apple
  install -m644 '../San Francisco Pro Font License.rtf' "${pkgdir}"/usr/share/licenses/apple/
}

