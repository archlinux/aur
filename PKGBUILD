# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-db-postgresql
pkgver=1.4.1
pkgrel=1
pkgdesc="API to access database, PostgreSQL component."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-db-postgresql"
depends=('octetos-db-abstract' 'postgresql-libs')
md5sums=('8030f16e43155433f49db56e3d38a995')
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
