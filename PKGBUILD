pkgname=otf-stix
pkgver=2.0.0
pkgrel=3
pkgdesc="An OpenType font with math support, designed for scientific and engineering printing"
arch=('any')
url="http://www.stixfonts.org"
license=('custom:OFL')
depends=('fontconfig')
source=("https://github.com/stipub/stixfonts/raw/$pkgver/zipfiles/STIXv$pkgver.zip")
sha256sums=('0e878b50ac6fbafbee431db4f10aa618efe34451f9922924047a2419a15e6242')

package() {
  cd "$srcdir/STIXv$pkgver"

  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 Fonts/OTF/*.otf "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 "docs/STIX_${pkgver}_license.pdf" "$pkgdir/usr/share/licenses/$pkgname/OFL.pdf"
}
