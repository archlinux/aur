# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="libre-baskerville"
_group="impallari"
pkgname=ttf-$_group-$_font
pkgver=2.002
pkgrel=1
pkgdesc="font optimized for web body text by Pablo Impallari"
arch=(any)
options=(!debug)
url="https://github.com/impallari/Libre-Baskerville"
license=('OFL-1.1-RFN')
groups=("$_group-fonts")
_commit=f8e8e811769ace1e56ab94993578aef55c668752
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/impallari/Libre-Baskerville/archive/$_commit.zip")
sha256sums=('cdac0b35a0c52ac99766854bb81af40f7faced2879f293ae31efa78538241274')

package() {
  cd $srcdir/Libre-Baskerville-$_commit

  install -Dpm644 fonts/ttf/*.ttf -t "$pkgdir/usr/share/fonts/TTF/$_group/"
  install -Dpm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dpm644 FONTLOG.txt README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
