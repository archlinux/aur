# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
pkgname=hyphen-ru
pkgver=0.1
pkgrel=3
pkgdesc="Russian hyphenation rules"
arch=('any')
url="http://wiki.services.openoffice.org/wiki/Dictionaries"
license=('LGPL')
optdepends=('hyphen: offers hyphenation library functions')
source=(#http://ftp.services.openoffice.org/pub/OpenOffice.org/contrib/dictionaries/hyph_ru_RU.zip
# mirror from ApacheOpenOffice - see: http://www.openoffice.org/distribution/mirrors/master.html
# http://sunsite.informatik.rwth-aachen.de/ftp/pub/mirror/OpenOffice/contrib/dictionaries/hyph_ru_RU.zip
https://master.dl.sourceforge.net/project/openofficeorg.mirror/contrib/dictionaries/hyph_ru_RU.zip)
sha256sums=('95b2198f937f1ba1fe2373302c81517ee88a38c237a1ed5557c543a7e2b141df')

package() {
  cd "$srcdir"
  install -vdm755 "$pkgdir/usr/share/"{hyphen,myspell/dicts,"doc/$pkgname"}
  for dict in hyph_ru_RU.dic; do
    install -vm644 "$dict" "$pkgdir/usr/share/hyphen"
    ln -sv "/usr/share/hyphen/$dict" "$pkgdir/usr/share/myspell/dicts"
  done
  install -vm644 README_hyph_ru_RU.txt "$pkgdir/usr/share/doc/$pkgname"
}
