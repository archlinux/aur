pkgname=qpress
pkgver=2
pkgrel=11
pkgdesc="qpress is a portable file archiver using QuickLZ and designed to utilize fast storage systems to their max"
arch=('i686' 'x86_64')
url="http://quicklz.com/"
license=('GPL')
source=(http://www.quicklz.com/qpress-$pkgrel-source.zip)
md5sums=('ea2d8bc96e86e93f64a93bc546401c95')

build() {
  cd $startdir/src/
  # Fix for isatty()
  sed -i 's|#include <sys/types.h>|#include <sys/types.h>\n  #include <unistd.h> // for isatty()|' qpress.cpp 
  make
}

package(){
    install -d $pkgdir/usr/bin/
    install $startdir/src/qpress $pkgdir/usr/bin/
}

