# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-biblion
pkgver=0.1.1
pkgrel=1
pkgdesc="Library for reading biblia."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-biblion.git"
depends=('octetos-core')
#backup=('etc/nanorc')
md5sums=('d81bf1e9b27cf3839f65a0de3b521232')
source=(https://github.com/azaeldevel/octetos-biblion/archive/0.1.1-alpha.tar.gz)

build() {
    cd octetos-biblion-0.1.1-alpha
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
  cd octetos-biblion-0.1.1-alpha
  make DESTDIR="${pkgdir}" install
}
