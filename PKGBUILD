# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=apidb-mariadb
pkgver=5.0.0
pkgrel=2
pkgdesc="API Generator for Database acces."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/apidb"
depends=('octetos-db-maria' 'libxml2' 'boost' 'bison' 'flex' 'gtkmm' 'libtar' 'imagemagick' 'cmake' 'cunit')
md5sums=('4d4df06f7f589165cc2c4b1074438e7b')
source=(https://github.com/azaeldevel/apidb/archive/5.0.0-alpha10.zip)
conflicts=('apidb')

build() {
    cd apidb-5.0.0-alpha10
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DAPIDB_VERSION_STAGE=alpha -DPLATFORM=LINUX_ARCH -DAPIDBBUILD="CORE;MARIADB" -DAPIDBINSTALL="DRIVERS" ..
    make
}

package() {
  cd apidb-5.0.0-alpha10/build
  make DESTDIR="$pkgdir" install
}
