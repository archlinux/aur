# Maintainer: Daniel YC Lin <dlin.tw at gmail.com>
pkgname=allin1
pkgver=0.5.0
pkgrel=2
pkgdesc="All in one monitoring dockapplet"
url="http://sourceforge.net/projects/allinone"
license="GPL"
arch=('i686' 'x86_64')
depends=('libxpm')
source=(http://downloads.sf.net/sourceforge/allinone/Allin1/$pkgname-$pkgver.tar.gz \
  allin1.conf)
changelog=changelog
build() {
  cd $srcdir/$pkgname-$pkgver
  make || return 1
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/src/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 "allin1.conf" "$pkgdir/usr/share/$pkgname/allin1.conf"
  install -Dm 644 "$srcdir/$pkgname-$pkgver/docs/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
md5sums=('aecceae899cb040051ec4bbb205bfb5b'
         '127d8c6c25f2e034331a7d0a84574581')
# vim:set ts=2 sw=2 et sta:
