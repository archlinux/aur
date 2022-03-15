# Maintainer: wereii <wereii+aur@wereii.cz>
# Contributor: Vladimir Cerny <blackvladimir@gmail.com>


pkgname=asco
pkgver=0.4.11
pkgrel=1
pkgdesc="A SPICE Circuit Optimizer."
arch=('i686' 'x86_64')
url="http://asco.sourceforge.net"
license=('GPL')
depends=('glibc')
source=("http://downloads.sourceforge.net/sourceforge/asco/ASCO-$pkgver.tar.gz")
sha256sums=('5b52161b4e5d1ddb61445f5be506525aaea95990e29e3043dbcbd51f2ed8fd3d')

prepare() {
  #cd "$srcdir/ASCO-$pkgver"
  # append ' -fcommon' after CFLAGS of all Makefiles
  # find . -type f -iname "Makefile" -exec sed -i "/^CFLAGS =/ s/$/ -fcommon/" {} \;
  true
}

build() {
  cd "$srcdir/ASCO-$pkgver"
  make
}

package(){
  install -D $srcdir/ASCO-$pkgver/asco "$pkgdir/usr/bin/asco"
}
