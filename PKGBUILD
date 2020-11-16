# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-db-abstract
pkgver=0.1.2
pkgrel=1
pkgdesc="API to access database, abstract component."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-db-abstract"
depends=('octetos-core')
#backup=('etc/nanorc')
md5sums=('6af516cd3d515429cf2cf52caa488ac2')
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
