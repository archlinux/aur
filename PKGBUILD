# Maintainer: Steven Allen <steven@stebalien.com>
# Contributor: stlarch  stlarchie@gmail.com

pkgname=stlarch_font
pkgver=1.5
pkgrel=1
pkgdesc="Font with icons for status bars"
arch=('any')
url="http://sourceforge.net/projects/stlarchfont"
license=('GPL2')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-mkfontdir' 'xorg-mkfontscale')
install=stlarch_font.install
source=("https://github.com/Stebalien/${pkgname}/archive/v${pkgver}.tar.gz")

package () {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm755 "$pkgdir/usr/share/fonts/local"
  install -m644 *.pcf "$pkgdir/usr/share/fonts/local"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"

  gzip "$pkgdir/usr/share/fonts/local/"*
}
sha256sums=('3ddbc60c341c6af8dd0ce732c6ae863d435ea72c63613fa19c6e50ab0f399bbc')
