# Maintainer: Alexander Konarev (avkonarev) <AVKonarev@gmail.com>
# Author: Fritz Webering (fritzw)

pkgname=ld_preload_open
pkgver=0
pkgrel=1
pkgdesc="This library can trick a process into opening absolute paths from a different location, similar to bind mounts, but without root access"
arch=('i686' 'x86_64')
url="https://github.com/fritzw/ld-preload-open"
license=('MIT')
arch=('x86_64')
source=("git+https://github.com/fritzw/ld-preload-open")
sha256sums=('SKIP')

makedepends=('gcc')

#prepare(){
#  cd $srcdir/DMusic-$pkgver
#  [ -d build ] || mkdir build
#}

build(){
  cd $srcdir/ld-preload-open
  make all
}

package() {
    cd $srcdir/ld-preload-open
    mkdir -p $pkgdir/usr/lib/ld-preload-open
    cp *.so $pkgdir/usr/lib/ld-preload-open
}
