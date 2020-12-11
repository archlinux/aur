pkgname=pguri
pkgver=1.20151224
pkgrel=8
pkgdesc="uri data type for PostgreSQL"
arch=('i686' 'x86_64')
url="https://github.com/petere/pguri/"
license=('MIT')
depends=('postgresql>13' 'postgresql<14' 'uriparser')
source=(${url}archive/${pkgver}.tar.gz)
b2sums=('3df2f93a2f21bbe2c492aeac47adb2451c20ea2c7c0639c82b086621f8425ec12db08229e73d1271752bf62143282c2b2cf48973871c0fec8c3fccc293481383')

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/pguri/LICENSE"
}
