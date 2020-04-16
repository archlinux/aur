# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=apidb
pkgver=4.3.3
pkgrel=1
pkgdesc="API Generator for Database acces."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/apidb"
depends=('octetos-db-maria' 'libxml2' 'boost' 'bison' 'flex' 'gtkmm' 'libtar' 'imagemagick' 'cmake' 'cunit')
md5sums=('00af0411e4f8fbf78dba5095c27ce098')
source=(https://github.com/azaeldevel/apidb/archive/4.3.3-beta.5.tar.gz)

build() {
    cd apidb-4.3.3-beta.5
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Debug -DAPIDB_VERSION_STAGE=betarelease -DAPIDB_MARIADB=Y -DDISTRO="ArchLinux" -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
  cd apidb-4.3.3-beta.5/build
  make DESTDIR="$pkgdir" install
}
