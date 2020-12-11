pkgname=postgresql-debversion
pkgver=1.1.1
pkgrel=3
pkgdesc="Debian version number type for PostgreSQL"
arch=('i686' 'x86_64')
url="https://packages.debian.org/source/sid/postgresql-debversion"
license=('GPL3')
depends=('postgresql>13' 'postgresql<14' 'apt')
source=("https://deb.debian.org/debian/pool/main/p/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz")
b2sums=('3b19b95b119095918478b7e3e26232599902a5fd3c3e9026d5c35bedef02c95020367c2a5f0dc1336780c2c4250524fe14d341c1d5c348c3f1e88c38d06be8dd')

build() {
  cd "$pkgname"

  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" install
}
