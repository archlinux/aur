# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=vlna
pkgver=1.5
pkgrel=1
pkgdesc="TeX and LaTeX utility to add the ~ by Czech typesetting conventions"
arch=('i686' 'x86_64')
url="http://petr.olsak.net/"
license=('custom')
depends=('glibc')
conflicts=('texlive-bin')
source=(ftp://math.feld.cvut.cz/pub/olsak/vlna/vlna-$pkgver.tar.gz \
        LICENSE)
md5sums=('82f975d59692e159794cc6a717e0f75d'
         '51eec77b6812a9b6c0c0d6cb0bf3ced6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -D -m644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
