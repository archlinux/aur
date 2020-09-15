# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=apidb-gtk
pkgver=5.0.0
pkgrel=1
pkgdesc="API Generator for Database acces."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/apidb"
depends=('apidb-core' 'gtk3')
md5sums=('82fa360272be05a2ddb7d026e909cd78')
source=(https://github.com/azaeldevel/apidb/archive/5.0.0-alpha15.tar.gz)
conflicts=('apidb')

build() {
    cd apidb-5.0.0-alpha15
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DAPIDB_VERSION_STAGE=alpha -DPLATFORM=LINUX_ARCH -DAPIDBBUILD="CORE;GTK3" -DAPIDBINSTALL="GTK3" ..
    make
}

package() {
  cd apidb-5.0.0-alpha15/build
  make DESTDIR="$pkgdir" install
}
