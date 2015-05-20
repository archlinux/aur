# Maintainer: Fredrik Strandin <fredrik@strandin.name>

pkgname='hunspell-en-us-large'
pkgver=2015.05.18
pkgrel=1
pkgdesc="US English large hunspell dictionaries"
arch=('any')
url="http://wordlist.sourceforge.net/"
license=('LGPL' 'custom:scowl')
optdepends=('hunspell: the spell checking libraries and apps')
source=(http://downloads.sourceforge.net/wordlist/hunspell-en_US-large-${pkgver}.zip)
md5sums=('9440aa477ca2ea82ad081d15a828031c')
sha256sums=('952d6cb778b4c9ed34a225559b731ffe5164ab7ce1b8aacf39c1e349b836de7e')

package() {
  cd "$srcdir"
  install -dm755 $pkgdir/usr/share/hunspell
  install -m644 en_US-large.dic en_US-large.aff $pkgdir/usr/share/hunspell

  # the symlinks
  install -dm755 $pkgdir/usr/share/myspell/dicts
  ln -s /usr/share/hunspell/en_US-large.dic $pkgdir/usr/share/myspell/dicts/
  ln -s /usr/share/hunspell/en_US-large.aff $pkgdir/usr/share/myspell/dicts/

  # docs
  install -dm755 $pkgdir/usr/share/doc/$pkgname
  install -m644 README_en_US-large.txt $pkgdir/usr/share/doc/$pkgname

  # licenses
  install -dm755 $pkgdir/usr/share/licenses/$pkgname
  install -m644 README_en_US-large.txt $pkgdir/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
