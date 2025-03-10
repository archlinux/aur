# Submitter: mtorromeo
# Maintainer: Bink

pkgname=qpress
pkgver=1.1
pkgrel=12
pkgdesc="qpress is a portable file archiver using QuickLZ and designed to utilize fast storage systems to their max"
arch=('i686' 'x86_64')
url="http://quicklz.com/"
license=('GPL')
source=("https://github.com/B-Interactive/qpress/releases/download/$pkgver/qpress-11-source.zip")
md5sums=('ea2d8bc96e86e93f64a93bc546401c95')
sha256sums=('4bb66b1383bbc4c5490eec6088d37109e11205fb9f94ccd04cb84ec069829633')

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
