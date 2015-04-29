# Maintainer: Fredrik Strandin <fredrik@strandin.name>

pkgname='hunspell-en-us-large'
pkgver=2015.04.24
pkgrel=1
pkgdesc="US English large hunspell dictionaries"
arch=('any')
url="http://wordlist.sourceforge.net/"
license=('LGPL' 'custom:scowl')
optdepends=('hunspell: the spell checking libraries and apps')
source=(http://downloads.sourceforge.net/wordlist/hunspell-en_US-large-${pkgver}.zip)
md5sums=('9367bb2d3c038b7709a6a32c04a3ba77')
sha256sums=('b35ec66c6dad34bea002bd4662ca886fb27878e93eb569cea1cf0f63181cd853')

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
