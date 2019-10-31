pkgname=otf-xits
pkgver=1.301
pkgrel=1
pkgdesc="An OpenType implementation of STIX fonts with math support"
arch=('any')
url="https://github.com/khaledhosny/xits"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
ghname=xits
source=("https://github.com/khaledhosny/$ghname/archive/v$pkgver.tar.gz")
sha256sums=('63a778f24e9275b7f2c7c78060e7ad6c375f5cff077852716537b26e9da8be69')

package() {
  cd "$srcdir/$ghname-$pkgver"

  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
