# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="libre-baskerville"
_group="impallari"
pkgname=ttf-$_group-$_font
pkgver=1.0
pkgrel=2
pkgdesc="font optimized for web body text by Pablo Impallari"
arch=(any)
url="https://github.com/impallari/Libre-Baskerville"
license=('OFL')
groups=("$_group-fonts")
_commit=9e9e2a6be500dc261dbeaba040b76cadc2e4522f
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/impallari/Libre-Baskerville/archive/$_commit.zip")
sha256sums=('5cd04f22242c48f0bd2449334e22b69fe5cc9b508ff0007c103432263912b38e')

package() {
  cd $srcdir/Libre-Baskerville-$_commit

  install -Dpm644 ./*.ttf -t "$pkgdir/usr/share/fonts/TTF/$_group/"
  install -Dpm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dpm644 FONTLOG.txt README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
