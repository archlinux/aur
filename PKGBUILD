# Maintainer: Erikas <erikmnkl@gmail.com>

pkgname=hunspell-lt
pkgver=20080216
pkgrel=1
pkgdesc="Lithuanian dictionary for Hunspell"
arch=('any')
license=('GPL2' 'LGPL2.1' 'MPL')
optdepends=('hunspell: Hunspell spell checking library and program')
source=(http://pkgs.fedoraproject.org/repo/pkgs/hunspell-lt/lt_LT-1.2.zip/48e27f6c26e8c72ca11f34526786fd1b/lt_LT-1.2.zip)
md5sums=('48e27f6c26e8c72ca11f34526786fd1b')

package() {
  cd "$srcdir"/lt_LT-1.2

  install -d -m755 "$pkgdir"/usr/share/hunspell
  install -m644 lt_LT.dic "$pkgdir"/usr/share/hunspell/lt_LT.dic
  install -m644 lt_LT.aff "$pkgdir"/usr/share/hunspell/lt_LT.aff

  install -d -m755 "$pkgdir"/usr/share/myspell/dicts
  ln -s /usr/share/hunspell/lt_LT.dic "$pkgdir"/usr/share/myspell/dicts/lt_LT.dic
  ln -s /usr/share/hunspell/lt_LT.aff "$pkgdir"/usr/share/myspell/dicts/lt_LT.aff
}
