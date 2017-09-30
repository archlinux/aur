# Maintainer: Amin Bandali <amin@aminb.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=otf-alegreya
pkgver=2.002
pkgrel=1
pkgdesc="Alegreya fonts"
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
url='http://www.fontsquirrel.com/fonts/alegreya'
source=("git+https://github.com/huertatipografica/Alegreya")
md5sums=('SKIP')
conflicts=('otf-google-fonts-hg')
install=$pkgname.install
license=('custom:OFL')

package() {
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -d "$pkgdir/usr/share/fonts/TTF"
  cp -dpr --no-preserve=ownership "$srcdir"/Alegreya/fonts/otf/*.otf \
     "$pkgdir/usr/share/fonts/OTF/"
  cp -dpr --no-preserve=ownership "$srcdir"/Alegreya/fonts/ttf*/*.ttf \
     "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 "$srcdir/Alegreya/LICENSE.md" \
	  "$pkgdir/usr/share/licenses/$pkgname/SIL_Open_Font_License.md"
  install -Dm644 "$srcdir/Alegreya/README.md" \
	  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
