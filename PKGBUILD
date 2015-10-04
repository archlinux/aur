# Maintainer: Erikas <erikmnkl@gmail.com>

pkgname=hunspell-lt
pkgver=20080216
pkgrel=1
pkgdesc="Lithuanian dictionary for Hunspell"
arch=('any')
license=('GPL2' 'LGPL2.1' 'MPL')
optdepends=('hunspell: Hunspell spell checking library and program')
source=(https://addons.mozilla.org/firefox/downloads/latest/3716/addon-3716-latest.xpi)
md5sums=('859da55cde561a400cf869e700fe409b')

package() {
  cd "$srcdir"/dictionaries

  mv lt.aff lt_LT.aff
  mv lt.dic lt_LT.dic

  install -d -m755 "$pkgdir"/usr/share/hunspell
  install -m644 lt_LT.dic "$pkgdir"/usr/share/hunspell/lt_LT.dic
  install -m644 lt_LT.aff "$pkgdir"/usr/share/hunspell/lt_LT.aff

  install -d -m755 "$pkgdir"/usr/share/myspell/dicts
  ln -s /usr/share/hunspell/lt_LT.dic "$pkgdir"/usr/share/myspell/dicts/lt_LT.dic
  ln -s /usr/share/hunspell/lt_LT.aff "$pkgdir"/usr/share/myspell/dicts/lt_LT.aff
}
