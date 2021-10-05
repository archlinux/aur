# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=apidb-commands
pkgver=5.13.7
pkgrel=1
pkgdesc="API Generator for Database acces."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/apidb"
depends=('apidb-core')
md5sums=('75b5729a84d2b87ea788e467c757846b')
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
