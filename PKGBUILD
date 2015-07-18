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
source=("http://sourceforge.net/projects/stlarchfont/files/$pkgname-$pkgver.tar.gz")

package () {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm755 "$pkgdir/usr/share/fonts/local"
  install -m644 *.pcf "$pkgdir/usr/share/fonts/local"
  install -Dm644 README.stlarch "$pkgdir/usr/share/doc/$pkgname/README"

  gzip "$pkgdir/usr/share/fonts/local/"*
}
sha256sums=('bce5386cdc5efc1e3b5af3e26768c09a303df9fc43ed039eb82ebe8c7da803c3')
