# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="libre-baskerville"
_group="impallari"
pkgname=ttf-$_group-$_font
pkgver=2.003
pkgrel=1
pkgdesc="font optimized for web body text by Pablo Impallari"
arch=(any)
options=(!debug)
url="https://github.com/impallari/Libre-Baskerville"
license=('OFL-1.1-RFN')
groups=("$_group-fonts")
_commit=a658d05478fc33cd5b7fa1129258f498553b5532
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/impallari/Libre-Baskerville/archive/$_commit.zip")
sha256sums=('56093bb2885de5ab2bd8c2c4672e515f37280179e5e7ef14665e05d72a7b21ed')

package() {
  cd $srcdir/Libre-Baskerville-$_commit

  install -Dpm644 fonts/ttf/*.ttf -t "$pkgdir/usr/share/fonts/TTF/$_group/"
  install -Dpm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dpm644 FONTLOG.txt README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
