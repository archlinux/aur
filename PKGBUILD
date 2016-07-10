# Maintainer: Fredrik Strandin <fredrik@strandin.name>

pkgname='hunspell-en-us-large'
pkgver=2016.06.26
pkgrel=1
pkgdesc="US English large hunspell dictionaries"
arch=('any')
url="http://wordlist.sourceforge.net/"
license=('LGPL' 'custom:scowl')
optdepends=('hunspell: the spell checking libraries and apps')
source=(http://downloads.sourceforge.net/wordlist/hunspell-en_US-large-${pkgver}.zip)
sha256sums=('16a431777e6ed6c471d521defe11cdc492da0322b8b90d9f2ea3aef7d8284408')

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
