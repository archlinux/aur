# Maintainer: Jesús Castro (51v4n) <51v4n@openmailbox.org>

pkgname=otf-san-francisco
pkgver=1.1
pkgrel=2
pkgdesc='The system font for macOS, iOS, watchOS, and tvOS'
arch=('any')
license=('custom')
url='https://developer.apple.com/fonts/' 
depends=('fontconfig' 'xorg-font-utils')
source=("https://developer.apple.com/fonts/downloads/SFPro.zip")
sha256sums=('5c596d7d5d54fd309f973809edbc0297ac15979c2c40ebc380ae9397501306ed')

package() {
  cd "$srcdir/SFPro"

  mkdir pkg
  bsdtar xvPf 'San Francisco Pro.pkg' || true
  bsdtar xvPf 'San Francisco Pro.pkg/Payload'

  install -d $pkgdir/usr/share/fonts/OTF/
  install -m644 Library/Fonts/*.otf $pkgdir/usr/share/fonts/OTF/

  install -d $pkgdir/usr/share/licenses/$pkgname/
  install -m644 'SF UI Font License.rtf' $pkgdir/usr/share/licenses/$pkgname/LICENSE.rtf
}
