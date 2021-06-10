pkgname=otf-stix
pkgver=2.13
pkgrel=1
pkgdesc="An OpenType font with math support, designed for scientific and engineering printing"
arch=('any')
url="http://www.stixfonts.org"
license=('custom:OFL')
source=(
    "static_otf-$pkgver.zip::https://github.com/stipub/stixfonts/raw/v$pkgver/zipfiles/static_otf.zip"
    "OFL-$pkgver.txt::https://github.com/stipub/stixfonts/raw/v$pkgver/OFL.txt"
)
sha256sums=('58f759a766ba4fa3d4d112b190e8119afd64984aaa31d5dc273a8ce46223cc29'
            'bec17cee6412788db45fd2644b301afbc99cc5d372ddd3345dc4a7bfdefb9f04')

package() {
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 static_otf/*.otf "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 "OFL-$pkgver.txt" "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
