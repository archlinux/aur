pkgname=otf-xits
pkgver=1.108
pkgrel=6
pkgdesc="An OpenType implementation of STIX fonts with math support"
arch=('any')
url="https://github.com/khaledhosny/xits"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
ghname=xits
source=("https://github.com/khaledhosny/$ghname/archive/v$pkgver.tar.gz")
sha256sums=('ee7231eb836d94ddc20a1b631866ef12dfeaace794389071948e4931e3d751ec')

package() {
  cd "$srcdir/$ghname-$pkgver"

  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
  install -Dm644 OFL-FAQ.txt "$pkgdir/usr/share/licenses/$pkgname/OFL-FAQ.txt"
}
