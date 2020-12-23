pkgname=otf-stix
pkgver=2.10
pkgrel=1
pkgdesc="An OpenType font with math support, designed for scientific and engineering printing"
arch=('any')
url="http://www.stixfonts.org"
license=('custom:OFL')
source=(
    "https://raw.githubusercontent.com/stipub/stixfonts/v$pkgver/docs/OFL.txt"
    "https://raw.githubusercontent.com/stipub/stixfonts/v$pkgver/zipfiles/static_otf.zip"
)
sha256sums=('0438a245387dce3a3252966a3b419c0369da55ad77ccf4e73c1dc450ac46b283'
            '1494bc57d989587df29c33735dfab3be331e58b97b048a6c4bb33f5048d66602')

package() {
  cd "$srcdir/"

  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 static_otf/*.otf "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
