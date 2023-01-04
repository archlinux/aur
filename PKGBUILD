# Maintainer: Harry Beadle <harrybeadle@protonmail.com>
# Maintainer: Walter Weiss <wltrwss@pm.me>

# Other packages of Apple Fonts you could be interested in: 
# 1) otf-san-francisco 
# 2) otf-san-francisco-mono 
# are also in AUR.

pkgname=otf-new-york
pkgver=1
pkgrel=8
_source_name='NY-Font-$pkgver-$pkgrel.dmg'
pkgdesc='Apple-designed serif typeface based on essential aspects of historical type styles. Sourced directly from Apple.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom')
makedepends=('p7zip')
source=('$_source_name::https://devimages-cdn.apple.com/design/resources/download/NY.dmg')
sha512sums=('f0a07d5531a2bfb00c3dd9ed9c2f56e9bd5ae55efce153d34cd18005473e14aca9baa19ce044dd99201b72ab94fd576dcb1ce771b6d3d3efe37740d38ae3fad3')

prepare() {
  7z x $_source_name
  7z x 'NYFonts/NY Fonts.pkg'
  7z x 'Payload~'
}

package() {
  cd 'Library/Fonts/'
  install -d '${pkgdir}'/usr/share/fonts/apple
  install -m644 *.otf '${pkgdir}'/usr/share/fonts/apple/
}
