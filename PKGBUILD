# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=apidb-gtk
pkgver=5.13.12
pkgrel=1
pkgdesc="API Generator for Database acces."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/apidb"
depends=('apidb-core' 'gtk3')
md5sums=('9ace5cdc41a2884f572bac17f9956b08')
source=(https://github.com/azaeldevel/apidb/archive/${pkgver}-beta.tar.gz)
conflicts=('apidb')

build() {
    cd apidb-${pkgver}-beta
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DPLATFORM=LINUX_ARCH -DAPIDBBUILD="CORE;GTK3" -DAPIDBINSTALL=GTK3 ..
    make
}

package() {
  cd apidb-${pkgver}-beta/build
  make DESTDIR="$pkgdir" install
}
