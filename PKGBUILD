# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-db-abstract
pkgver=0.6.0
pkgrel=1
pkgdesc="API to access database, abstract component."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-db-abstract"
depends=('octetos-core')
#backup=('etc/nanorc')
md5sums=('1ac1e74d3562078bf430c6570323501e')
source=(https://github.com/azaeldevel/${pkgname}/archive/${pkgver}-alpha.tar.gz)

build() {
    cd ${pkgname}-${pkgver}-alpha
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
  cd ${pkgname}-${pkgver}-alpha
  make DESTDIR="${pkgdir}" install
}
