# Contributer: giacomogiorgianni@gmail.com 

pkgname=hdrecover
pkgver=0.5
pkgrel=3
pkgdesc="Tool to encourage hard disks to reallocate bad sectors allowing data recovery"
arch=('i686' 'x86_64' 'pentium4')
url="http://sourceforge.net/projects/hdrecover/"
license=('LGPL')
depends=('glibc')
makedepends=('make')
#install=${pkgname}.install
#changelog=$pkgname.changelog
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('1cbe15f790fe383a20375b97aa3e5d04')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
}

package() {
  #make DESTDIR=$pkgdir install || return 1
  install -Dm755 $srcdir/$pkgname-$pkgver/$pkgname \
      "$pkgdir/usr/bin/$pkgname"
}
