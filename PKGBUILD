# Maintainer: Jesús Castro <x51v4n@gmail.com>
pkgname=otf-san-francisco
pkgver=1.0
pkgrel=4
epoch=1
pkgdesc='The system font for macOS, iOS, watchOS, and tvOS'
arch=('any')
license=('custom')
url='https://developer.apple.com/fonts/'
depends=('fontconfig' 
		 'xorg-font-utils')
source=(SFPro-1.0.zip::https://developer.apple.com/fonts/downloads/SFPro.zip)
md5sums=('c816b5ff4a82103fc6ff39674a4233d6')

package() {
  cd "$srcdir/SFPro"

  mkdir pkg
  bsdtar xvPf 'San Francisco Pro.pkg' || true
  bsdtar xvPf 'San Francisco Pro.pkg/Payload'

  install -d $pkgdir/usr/share/fonts/OTF/
  install -m644 Library/Fonts/*.otf $pkgdir/usr/share/fonts/OTF/

  install -d $pkgdir/usr/share/licenses/$pkgname/
  install -m644 'SF Pro Font License.rtf' $pkgdir/usr/share/licenses/$pkgname/LICENSE.rtf
}

