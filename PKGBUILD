# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=apidb-core
pkgver=5.0.0
pkgrel=1
pkgdesc="API Generator for Database acces."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/apidb"
depends=('octetos-db' 'libxml2' 'boost' 'bison' 'flex' 'gtkmm' 'libtar' 'imagemagick' 'cmake' 'cunit')
md5sums=('ef4dd62f87805882812f1e136a388012')
source=(https://github.com/azaeldevel/apidb/archive/5.0.0-alpha9.zip)

build() {
    cd apidb-5.0.0-alpha9
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DAPIDB_VERSION_STAGE=alpha -DPLATFORM=ArchLinux -DAPIDBBUILD=CORE -DAPIDBINSTALL=CORE ..
    make
}

package() {
  cd apidb-5.0.0-alpha9/build
  make DESTDIR="$pkgdir" install
}
