# Maintainer: Fredrik Strandin <fredrik@strandin.name>

pkgname='hunspell-en-us-large'
pkgver=2015.02.15
pkgrel=1
pkgdesc="US English large hunspell dictionaries"
arch=('any')
url="http://wordlist.sourceforge.net/"
license=('LGPL' 'custom:scowl')
optdepends=('hunspell: the spell checking libraries and apps')
source=(http://downloads.sourceforge.net/wordlist/hunspell-en_US-large-${pkgver}.zip)
md5sums=('fb0b79a032581d25cf43ff41d42cd81a')
sha256sums=('2779eb95ff530e0ae2319a6c6577772403009f7dae8bd41f9afcd4f5db767ce6')

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
