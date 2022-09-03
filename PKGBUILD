# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=apidb-core
pkgver=5.13.18
phase=alpha
pkgrel=1
pkgdesc="API Generator for Database acces."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/apidb"
depends=('octetos-db-abstract' 'libxml2' 'boost' 'bison' 'flex' 'libtar' 'librsvg' 'cmake' 'cunit')
md5sums=('02c5dbaeb0cd59bb9864bf394377e0da')
source=(https://github.com/azaeldevel/apidb/archive/${pkgver}-${phase}.tar.gz)
conflicts=('apidb')

build() {
    cd apidb-${pkgver}-${phase}
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DAPIDB_VERSION_STAGE=${phase} -DPLATFORM=LINUX_ARCH -DAPIDBBUILD=CORE -DAPIDBINSTALL=CORE ..
    make
}

package() {
  cd apidb-${pkgver}-${phase}/build
  make DESTDIR="$pkgdir" install
}
