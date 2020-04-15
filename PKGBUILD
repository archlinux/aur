# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=apidb
pkgver=4.3.1
pkgrel=1
pkgdesc="API Generator for Database acces."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/apidb"
depends=('octetos-db-maria' 'libxml2' 'boost' 'bison' 'flex' 'gtkmm' 'libtar' 'imagemagick' 'cmake' 'cunit')
md5sums=('5ce502e8d2cc6abc030b0a4c37d52fa3')
source=(https://github.com/azaeldevel/apidb/archive/4.3.2-beta.4.tar.gz)

build() {
    cd apidb-4.3.2-beta.4
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Debug -DAPIDB_VERSION_STAGE=betarelease -DAPIDB_MARIADB=Y -DDISTRO="ArchLinux" -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
  cd apidb-4.3.2-beta.4/build
  make DESTDIR="$pkgdir" install
}
