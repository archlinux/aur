pkgname=otf-xits
pkgver=1.108
pkgrel=4
pkgdesc="An OpenType implementation of STIX fonts with math support"
arch=('any')
url="https://github.com/khaledhosny/xits-math"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
ghname=xits-math
source=("https://github.com/khaledhosny/$ghname/archive/v$pkgver.tar.gz")
sha256sums=('ec0742b7291ab96df28188e92fdf1293006a538267edc2b282d6615923833ceb')

package() {
  cd "$srcdir/$ghname-$pkgver"

  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
  install -Dm644 OFL-FAQ.txt "$pkgdir/usr/share/licenses/$pkgname/OFL-FAQ.txt"
}
