# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-coreutils
pkgver=0.4.0
pkgrel=1
pkgdesc="Similar to coretils but is a C ++ API."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-core.git"
depends=('octetos-core')
#backup=('etc/nanorc')
md5sums=('4b60a803e43489e0be67b52524d5bbb6')
source=(https://github.com/azaeldevel/octetos-coreutils/archive/0.4.0-alpha.1.tar.gz)

build() {
    cd octetos-coreutils-0.4.0-alpha.1
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
  cd octetos-coreutils-0.4.0-alpha.1
  make DESTDIR="${pkgdir}" install
}
