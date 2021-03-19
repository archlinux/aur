# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-db-maria
pkgver=1.10.0
pkgrel=2
pkgdesc="API to access database, MariaDB component."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-db"
depends=('octetos-db-abstract' 'mariadb-clients')
md5sums=('4f3c75ccdd26bea226ae2a13538d0883')
source=(https://github.com/azaeldevel/${pkgname}/archive/${pkgver}-alpha.tar.gz)

build() {
    cd ${pkgname}-${pkgver}-alpha
    autoreconf -fi
    ./configure --with-archlinux --prefix=/usr --sysconfdir=/etc 
    make
}

package() {
  cd ${pkgname}-${pkgver}-alpha
  make DESTDIR="${pkgdir}" install
}
