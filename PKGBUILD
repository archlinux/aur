pkgname=postgresql-debversion
pkgver=1.0.8
pkgrel=2
pkgdesc="Debian version number type for PostgreSQL"
arch=('i686' 'x86_64')
url="https://packages.debian.org/source/sid/postgresql-debversion"
license=('GPL3')
depends=('postgresql>9.5' 'postgresql<9.6' 'apt')
source=("http://httpredir.debian.org/debian/pool/main/p/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('baa7f0eeda937a6fd9024408965739dc390c20f86ad077d915ecaffd14664229')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
