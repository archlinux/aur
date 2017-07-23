# Maintainer: Mauro Santos <registo.mailling@gmail.com>
# Contributer: AndyRTR <andyrtr@archlinux.org>

pkgname='mythes-en-us'
pkgver=20060306
pkgrel=2
arch=('any')
url="http://wiki.services.openoffice.org/wiki/Dictionaries#English_.28AU.2CCA.2CGB.2CNZ.2CUS.2CZA.29"
license=('LGPL')
pkgdesc="English thesaurus (en_US only)"
optdepends=('libmythes: offers thesaurus library functions')
conflicts=('mythes-en')
# Fedora uses http://www.danielnaber.de/wn2ooo/ but it doesn't look more fresh
source=("http://vesta.informatik.rwth-aachen.de/ftp/pub/mirror/OpenOffice/contrib/dictionaries/thes_en_US_v2.zip")
sha256sums=('0e1362f89572ec50aa46ca2db4980356b7c759a5a5610e892802a28427425a3b')

package() {
  cd ${srcdir}
  install -dm755 ${pkgdir}/usr/share/mythes
  install -m644 th_en_US_v2.idx ${pkgdir}/usr/share/mythes
  install -m644 th_en_US_v2.dat ${pkgdir}/usr/share/mythes

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  ln -s /usr/share/mythes/th_en_US_v2.idx ${pkgdir}/usr/share/myspell/dicts
  ln -s /usr/share/mythes/th_en_US_v2.dat ${pkgdir}/usr/share/myspell/dicts
  
  # docs
  install -dm755 ${pkgdir}/usr/share/doc/$pkgname
  install -m644 README_th_en_US_v2.txt ${pkgdir}/usr/share/doc/$pkgname
}

