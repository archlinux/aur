pkgname=otf-stix
pkgver=2.0.0
pkgrel=2
pkgdesc="An OpenType font with math support, designed for scientific and engineering printing"
arch=('any')
url="http://www.stixfonts.org"
license=('custom:OFL')
depends=('fontconfig')
source=("https://github.com/stipub/stixfonts/blob/$pkgver/zipfiles/STIXv$pkgver.zip")
sha256sums=('f8a141355690e0a1984a196409d6685f0493413595dec087c77e4bff6721dfd7')

package() {
  cd "$srcdir/STIXv$pkgver"

  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 Fonts/OTF/*.otf "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 "docs/STIX_${pkgver}_license.pdf" "$pkgdir/usr/share/licenses/$pkgname/OFL.pdf"
}
