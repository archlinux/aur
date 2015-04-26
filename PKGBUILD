pkgname=postgresql-debversion
pkgver=1.0.7
pkgrel=1
pkgdesc="Debian version number type for PostgreSQL"
arch=('i686' 'x86_64')
url="https://packages.debian.org/source/sid/postgresql-debversion"
license=('GPL3')
depends=('postgresql' 'apt')
source=("http://ftp.debian.org/debian/pool/main/p/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('13fb00112cd0ad0ce76b2415649aec02f8925d8b3e704fb4187c9a684435b2b6')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
