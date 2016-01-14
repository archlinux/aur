pkgname=otf-xits
pkgver=1.108
pkgrel=2
pkgdesc="An OpenType implementation of STIX fonts with math support"
arch=('any')
url="https://github.com/khaledhosny/xits-math"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=otf-xits.install
ghname=xits-math
source=("https://github.com/khaledhosny/$ghname/archive/v$pkgver.tar.gz")
md5sums=('6a9ff635ecc47edc0c13794f2b2a8ce1')

package() {
  cd "$srcdir/$ghname-$pkgver"

  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL-FAQ.txt"
}
