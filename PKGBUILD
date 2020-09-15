# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-db
pkgver=1.3.10
pkgrel=1
pkgdesc="C++ library for Database Acces."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-db"
depends=('octetos-core')
#backup=('etc/nanorc')
md5sums=('c93eaa5d397ec88e7deb83b25fd375f5')
source=(https://github.com/azaeldevel/octetos-db/archive/1.3.10-alpha.tar.gz)

build() {
    cd octetos-db-1.3.10-alpha
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc --docdir=${datarootdir}/doc/${pkgname}-${pkgver} --with-abstract
    make
}

package() {
  cd octetos-db-1.3.10-alpha
  make DESTDIR="${pkgdir}" install
}
