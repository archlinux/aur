pkgname=postgresql-debversion
pkgver=1.1.1
pkgrel=2
pkgdesc="Debian version number type for PostgreSQL"
arch=('i686' 'x86_64')
url="https://packages.debian.org/source/sid/postgresql-debversion"
license=('GPL3')
depends=('postgresql>12' 'postgresql<13' 'apt')
source=("https://deb.debian.org/debian/pool/main/p/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz")
sha512sums=('5bb17568873aff8acb743b7143dd58a51a4dd7c862044deaf992527391d98819de8dae2669918a46e4958781c3f3e178a8196f7d65b48b8ec0f4080ff2ab2a93')

build() {
  cd "$pkgname"

  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" install
}
