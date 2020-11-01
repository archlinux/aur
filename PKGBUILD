# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-db-postgresql
pkgver=1.4.0
pkgrel=1
pkgdesc="C++ library for Database Acces."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-db-postgresql"
depends=('octetos-db-abstract' 'postgresql-libs')
md5sums=('4c4f9a31c0e781626e7f77db666c8de3')
source=(https://github.com/azaeldevel/${pkgname}/archive/${pkgver}-alpha.tar.gz)

build() {
    cd ${pkgname}-${pkgver}-alpha
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc --with-archlinux
    make
}

package() {
  cd ${pkgname}-${pkgver}-alpha
  make DESTDIR="${pkgdir}" install
}
