# Maintainer: Harry Beadle <harrybeadle@protonmail.com>

pkgname=otf-san-francisco-pro
pkgver=1
pkgrel=2
pkgdesc='System font for iOS, macOS, and tvOS. Sourced directly from Apple.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom')
makedepends=('p7zip')
source=('https://developer.apple.com/design/downloads/SF-Font-Pro.dmg')
md5sums=('da1f767a3d185cac4efe9003aefc082a')

prepare() {
  7z x SF-Font-Pro.dmg
  7z x SanFranciscoPro/San\ Francisco\ Pro.pkg
  7z x "Payload~"
}

package() {
  cd 'Library/Fonts'
  install -d "${pkgdir}"/usr/share/fonts/apple/
  install -m644 *.otf "${pkgdir}"/usr/share/fonts/apple/
}

