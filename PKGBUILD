pkgname=postgresql-debversion
pkgver=1.0.8
pkgrel=4
pkgdesc="Debian version number type for PostgreSQL"
arch=('i686' 'x86_64')
url="https://packages.debian.org/source/sid/postgresql-debversion"
license=('GPL3')
depends=('postgresql>10' 'postgresql<11' 'apt')
source=("http://deb.debian.org/debian/pool/main/p/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz")
sha512sums=('f1cfcbdc1a2a7464f66afbe21347497566efa668662c236697b0276ad462897526883152c8f317df1f3e8768abaa11b906689c7810c084f4e7a732420d7c61a8')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
