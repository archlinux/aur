# Maintainer: Harry Beadle <harrybeadle@protonmail.com>

pkgname=otf-san-francisco-mono
pkgver=1
pkgrel=2
pkgdesc='Monospaced variant of San Francisco. Sourced directly from Apple.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom')
makedepends=('p7zip')
source=('https://developer.apple.com/design/downloads/SF-Mono.dmg')
md5sums=('d93f9f19c962547d18b72f532e91ecdd')

prepare() {
  7z x SF-Mono.dmg
  7z x "SFMonoFonts/SF Mono Fonts.pkg"
  7z x "Payload~"
}

package() {
  cd 'Library/Fonts/'
  install -d "${pkgdir}"/usr/share/fonts/apple
  install -m644 *.otf "${pkgdir}"/usr/share/fonts/apple/
}

