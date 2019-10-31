pkgname=otf-stix
pkgver=2.0.2
pkgrel=1
pkgdesc="An OpenType font with math support, designed for scientific and engineering printing"
arch=('any')
url="http://www.stixfonts.org"
license=('custom:OFL')
depends=('fontconfig')
source=("https://github.com/stipub/stixfonts/raw/v$pkgver/zipfiles/STIXv$pkgver.zip")
sha256sums=('fef26941bf7eeab7ed6400a386211ba11360f0b2df22002382ceb3e2b551179d')

package() {
  cd "$srcdir/STIXv$pkgver"

  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 OTF/*.otf "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 "docs/STIX_${pkgver}_license.pdf" "$pkgdir/usr/share/licenses/$pkgname/OFL.pdf"
}
