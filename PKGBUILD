# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-coreutils
pkgver=0.7.0
pkgrel=1
pkgdesc="Similar to coretils but is a C ++ API."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-core.git"
depends=('octetos-core')
#backup=('etc/nanorc')
md5sums=('3ff3acda32f6f6e5f02ff0c8f4f00521')
source=(https://github.com/azaeldevel/octetos-coreutils/archive/0.7.0-alpha.tar.gz)

build() {
    cd octetos-coreutils-0.7.0-alpha
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
  cd octetos-coreutils-0.7.0-alpha
  make DESTDIR="${pkgdir}" install
}
