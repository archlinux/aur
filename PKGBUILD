# Maintainer: Mike Sampson <mike at sambodata dot com>
# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
pkgname=clpbar
pkgver=1.11.1
pkgrel=2
pkgdesc="Simple tool to show the user information about data being passed in file transfers"
arch=('i686' 'x86_64')
url="http://clpbar.sourceforge.net"
license=('GPL')
depends=('glibc')
source=(http://downloads.sourceforge.net/clpbar/bar_$pkgver.tar.gz)
md5sums=('4836a9767cbfb9c0b16020d23b4b5e91')

build() {
  cd $srcdir/bar-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/bar-$pkgver
  make DESTDIR=$pkgdir/ install
  mv $pkgdir/usr/bin/bar $pkgdir/usr/bin/clpbar
  mv $pkgdir/usr/share/man/man1/bar.1 $pkgdir/usr/share/man/man1/clpbar.1
}
