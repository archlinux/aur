# Maintainer: Serhii Tsynailo <serhii.tsynailo@gmail.com>
pkgname=hyphen-uk
pkgver=0.1
pkgrel=1
pkgdesc="Ukrainian hyphenation rules"
arch=('any')
url="http://wiki.services.openoffice.org/wiki/Dictionaries"
license=('LGPL')
optdepends=('hyphen: offers hyphenation library functions')
source=(https://master.dl.sourceforge.net/project/openofficeorg.mirror/contrib/dictionaries/hyph_uk_UA.zip)
sha256sums=('539ccdae201b9437176ffa1d08dbcfe4ba9a1ac9762e32917edffc788abaf053')

package() {
  cd "$srcdir"
  install -vdm755 "$pkgdir/usr/share/"{hyphen,myspell/dicts,"doc/$pkgname"}
  for dict in hyph_uk_UA.dic; do
    install -vm644 "$dict" "$pkgdir/usr/share/hyphen"
    ln -sv "/usr/share/hyphen/$dict" "$pkgdir/usr/share/myspell/dicts"
  done
  install -vm644 README_hyph_uk_UA.txt "$pkgdir/usr/share/doc/$pkgname"
}
