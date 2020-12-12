# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=apidb-core
pkgver=5.0.5
pkgrel=1
pkgdesc="API Generator for Database acces."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/apidb"
depends=('octetos-db-abstract' 'libxml2' 'boost' 'bison' 'flex' 'libtar' 'imagemagick' 'cmake' 'cunit')
md5sums=('d86abee4da64e0d7e0f6e1209293c754')
source=(https://github.com/azaeldevel/apidb/archive/${pkgver}-beta.tar.gz)
conflicts=('apidb')

build() {
    cd apidb-${pkgver}-beta
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DAPIDB_VERSION_STAGE=alpha -DPLATFORM=LINUX_ARCH -DAPIDBBUILD=CORE -DAPIDBINSTALL=CORE ..
    make
}

package() {
  cd apidb-${pkgver}-beta/build
  make DESTDIR="$pkgdir" install
}
