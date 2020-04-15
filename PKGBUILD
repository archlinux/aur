# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-db-maria
pkgver=1.2.0
pkgrel=1
pkgdesc="C++ library for Database Acces."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-db"
depends=('octetos-core' 'mariadb-connector-c')
#backup=('etc/nanorc')
md5sums=('421c868a351e0c350827905ab561b8e3')
source=(https://github.com/azaeldevel/octetos-db/archive/1.2.2-alpha.6.tar.gz)

build() {
    cd octetos-db-1.2.2-alpha.6
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc --with-mariadb
    make
}

package() {
  cd octetos-db-1.2.2-alpha.6
  make DESTDIR="${pkgdir}" install
}
