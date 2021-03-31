pkgname=otf-stix
pkgver=2.12
pkgrel=1
pkgdesc="An OpenType font with math support, designed for scientific and engineering printing"
arch=('any')
url="http://www.stixfonts.org"
license=('custom:OFL')
source=(
    "https://raw.githubusercontent.com/stipub/stixfonts/v$pkgver/OFL.txt"
    "https://raw.githubusercontent.com/stipub/stixfonts/v$pkgver/zipfiles/static_otf.zip"
)
sha256sums=('bec17cee6412788db45fd2644b301afbc99cc5d372ddd3345dc4a7bfdefb9f04'
            'c42758da2a54c77e335b80f284942e0df2ebffaffb6f6a9ff9f32ca26ae3ec23')

package() {
  cd "$srcdir/"

  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 static_otf/*.otf "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
