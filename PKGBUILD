# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=ttf-overpass
pkgver=2.0
pkgrel=1
pkgdesc="An open source font family inpired by Highway Gothic esp. suited for signs, lettering and web sites (true type format)."
arch=('any')
license=('custom:SIL Open Font License 1.1')
url="http://overpassfont.org/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('overpass-ttf')
install=$pkgname.install
source=('https://github.com/andyfitz/overpass/archive/2.0.tar.gz'
        'LICENSE.md')
sha256sums=('8b6093e88c179760431a57eae862cc8bfe13b767fe0c8060ec7fd96729274383'
            '3efc4faefa080b65eb3365a4910b67a1697d8e560e1e6f1c30797a6aed4f719b')

package() {
  cd "$srcdir/overpass-$pkgver"

  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 "Desktop Fonts/"*.ttf "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 "$srcdir/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -m644 "Overpass Specimen 8-20-15.pdf" README.md \
    "$pkgdir/usr/share/doc/$pkgname"
}
