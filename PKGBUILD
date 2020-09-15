# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=apidb-postgresql
pkgver=5.0.0
pkgrel=3
pkgdesc="API Generator for Database acces."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/apidb"
depends=('octetos-db-postgresql' 'apidb-core')
md5sums=('9079b88650045e0ab212813903ce32ee')
source=(https://github.com/azaeldevel/apidb/archive/5.0.0-alpha18.tar.gz)
conflicts=('apidb')

build() {
    cd apidb-5.0.0-alpha18
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DAPIDB_VERSION_STAGE=alpha -DPLATFORM=LINUX_ARCH -DAPIDBBUILD="CORE;POSTGRESQL" -DAPIDBINSTALL="POSTGRESQL" ..
    make
}

package() {
  cd apidb-5.0.0-alpha18/build
  make DESTDIR="$pkgdir" install
}
