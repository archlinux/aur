# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=ttf-overpass
pkgver=2.1
pkgrel=1
pkgdesc="An open source font family inspired by Highway Gothic esp. suited for signs, lettering and web sites (true type format)."
arch=('any')
license=('custom:SIL Open Font License 1.1')
url="http://overpassfont.org/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('overpass-ttf')
install=$pkgname.install
source=("https://github.com/RedHatBrand/overpass/archive/${pkgver}.tar.gz"
        'LICENSE.md')
sha256sums=('a7562994399cdf33a2e91e4fb1e1e76bb44121f32007b4da15b01579537d9e06'
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
