# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-db
pkgver=1.3.2
pkgrel=1
pkgdesc="C++ library for Database Acces."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-db"
depends=('octetos-core')
#backup=('etc/nanorc')
md5sums=('e5471c2458e615cb4c92858469d0b588')
source=(https://github.com/azaeldevel/octetos-db/archive/1.3.2-alpha.tar.gz)

build() {
    cd octetos-db-1.3.2-alpha
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc --docdir=${datarootdir}/doc/${pkgname}-${pkgver} --with-abstract
    make
}

package() {
  cd octetos-db-1.3.2-alpha
  make DESTDIR="${pkgdir}" install
}
