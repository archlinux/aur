pkgname=pguri
pkgver=1.20151224
pkgrel=3
pkgdesc="uri data type for PostgreSQL"
arch=('i686' 'x86_64')
url="https://github.com/petere/pguri/"
license=('MIT')
depends=('postgresql>9.5' 'postgresql<9.6' 'uriparser')
source=(${url}archive/${pkgver}.tar.gz)
sha256sums=('259dd485e901b2363342eacbc2b867783cc0da0f12d4bddc1040d0a46fe58c1b')

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/pguri/LICENSE"
}
