pkgname=otf-stix
pkgver=2.0.0
pkgrel=1
pkgdesc="An OpenType font with math support, designed for scientific and engineering printing"
arch=('any')
url="http://www.stixfonts.org"
license=('custom:OFL')
depends=('fontconfig')
source=("https://sourceforge.net/projects/stixfonts/files/Current%20Release/STIXv$pkgver.zip")
sha256sums=('6fac297b27c78891aeca9adb37be54729932e57cdcdb218a9e163671c163d938')

package() {
  cd "$srcdir/STIXv$pkgver"

  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 Fonts/OTF/*.otf "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 "docs/STIX_${pkgver}_license.pdf" "$pkgdir/usr/share/licenses/$pkgname/OFL.pdf"
}
