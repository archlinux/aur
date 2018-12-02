pkgname=otf-xits
pkgver=1.200
pkgrel=1
pkgdesc="An OpenType implementation of STIX fonts with math support"
arch=('any')
url="https://github.com/khaledhosny/xits"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
ghname=xits
source=("https://github.com/khaledhosny/$ghname/archive/v$pkgver.tar.gz")
sha256sums=('1e44007035e3d0bb8fd2d2ad28ab0ce4cf7e804f2e4b16bf2be2a99069300b53')

package() {
  cd "$srcdir/$ghname-$pkgver"

  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
  install -Dm644 OFL-FAQ.txt "$pkgdir/usr/share/licenses/$pkgname/OFL-FAQ.txt"
}
