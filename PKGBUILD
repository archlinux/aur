# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=apidb-commands
pkgver=5.13.13
pkgrel=1
pkgdesc="API Generator for Database acces."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/apidb"
depends=('apidb-core')
md5sums=('0b669ceed5bdd0203a199b5d143929af')
source=(https://github.com/azaeldevel/apidb/archive/${pkgver}-beta.tar.gz)
conflicts=('apidb')

build() {
    cd apidb-${pkgver}-beta
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DAPIDB_VERSION_STAGE=beta -DPLATFORM=LINUX_ARCH -DAPIDBBUILD="CORE;COMMANDS" -DAPIDBINSTALL="COMMANDS" ..
    make
}

package() {
  cd apidb-${pkgver}-beta/build
  make DESTDIR="$pkgdir" install
}
