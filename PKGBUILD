# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=apidb-commands
pkgver=5.0.0
pkgrel=2
pkgdesc="API Generator for Database acces."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/apidb"
depends=('apidb-core')
md5sums=('f1d88bd5499fae19416af572d16c9d6a')
source=(https://github.com/azaeldevel/apidb/archive/5.0.0-alpha19.tar.gz)
conflicts=('apidb')

build() {
    cd apidb-5.0.0-alpha19
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DAPIDB_VERSION_STAGE=alpha -DPLATFORM=LINUX_ARCH -DAPIDBBUILD="CORE;COMMANDS" -DAPIDBINSTALL="COMMANDS" ..
    make
}

package() {
  cd apidb-5.0.0-alpha19/build
  make DESTDIR="$pkgdir" install
}
