# Contributer: AndyRTR <andyrtr@archlinux.org>
# Maintainer: Mauro Santos <registo.mailling@gmail.com>

pkgname='hunspell-en-base'
pkgver=7.1
pkgrel=2
pkgdesc="US English hunspell dictionaries"
arch=('any')
url="http://wordlist.sourceforge.net/"
license=('LGPL' 'custom:scowl')
optdepends=('hunspell: the spell checking libraries and apps')
conflicts=('hunspell-en')
source=(http://downloads.sourceforge.net/wordlist/hunspell-en_US-$pkgver-0.zip)
md5sums=('8eb485db0a722eb29a5eca517a22e367')

build() {
 /bin/true
}

package() {
  cd "$srcdir"
  install -dm755 $pkgdir/usr/share/hunspell
  install -m644 en_US.dic en_US.aff $pkgdir/usr/share/hunspell

  # the symlinks
  install -dm755 $pkgdir/usr/share/myspell/dicts
  ln -s /usr/share/hunspell/en_US.dic $pkgdir/usr/share/myspell/dicts/
  ln -s /usr/share/hunspell/en_US.aff $pkgdir/usr/share/myspell/dicts/
  
  # docs
  install -dm755 $pkgdir/usr/share/doc/$pkgname
  install -m644 README_en_US.txt $pkgdir/usr/share/doc/$pkgname

  # licenses
  install -dm755 $pkgdir/usr/share/licenses/$pkgname
  install -m644 README_en_US.txt $pkgdir/usr/share/licenses/$pkgname
}
