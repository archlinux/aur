pkgname=otf-stix
pkgver=2.0.1
pkgrel=1
pkgdesc="An OpenType font with math support, designed for scientific and engineering printing"
arch=('any')
url="http://www.stixfonts.org"
license=('custom:OFL')
depends=('fontconfig')
source=("https://github.com/stipub/stixfonts/raw/v$pkgver/zipfiles/STIXv$pkgver.zip")
sha256sums=('6bb3c6eee6761f4178bdb9eeed88b6bc391c80d496967f26d26988cbf1ab4883')

package() {
  cd "$srcdir/STIXv$pkgver"

  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 OTF/*.otf "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 "docs/STIX_${pkgver}_license.pdf" "$pkgdir/usr/share/licenses/$pkgname/OFL.pdf"
}
