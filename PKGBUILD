# Contributor: Michal Salaban <michal@salaban.info>
pkgname=sysfence
pkgver=0.17
pkgrel=1
pkgdesc="System resources guard"
arch=('i686' 'x86_64')
url="https://github.com/emesik/$pkgname"
license=('GPL')
source=("git://github.com/emesik/$pkgname#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd $srcdir/$pkgname/src/
  make
}

package() {
  cd $srcdir/$pkgname/src/

  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/$pkgname/
  cp $pkgname $pkgdir/usr/bin/
  cp ../doc/example.conf $pkgdir/usr/share/$pkgname/
}
