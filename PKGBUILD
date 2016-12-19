# Maintainer: Tarn Burton <twburton at gmail dot com>
pkgname='quex'
pkgver=0.65.66.5
pkgrel=1
pkgdesc="Generator of lexical analyzers in C and C++. Unicode Supported."
arch=('any')
url="http://quex.org/"
license=('LGPL')
provides=('quex')
depends=('python2')
source=("http://downloads.sourceforge.net/project/quex/DOWNLOAD/quex-$pkgver.tar.gz" "quex")
md5sums=('f7306de1020d567bd2ce3b72f98da56d'
         '89ee42a783fe1fb7bf7787cc861be1a3')

package() {
  install -D quex "$pkgdir/usr/bin/quex"
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr/share/$pkgname"
  #install -D manpage/quex.1 "$pkgdir/usr/share/man/man1/quex.1"
  cp -r * "$pkgdir/usr/share/$pkgname"
  #rm -r "$pkgdir/usr/share/$pkgname/manpage"
  install -d "$pkgdir/usr/share/man/man1"
  ln -s /usr/share/quex/manpage/quex.1 "$pkgdir/usr/share/man/man1/quex.1"
  install -d "$pkgdir/usr/include"
  ln -s /usr/share/quex/quex "$pkgdir/usr/include/quex"
}
