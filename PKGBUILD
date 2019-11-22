pkgname=pguri
pkgver=1.20151224
pkgrel=7
pkgdesc="uri data type for PostgreSQL"
arch=('i686' 'x86_64')
url="https://github.com/petere/pguri/"
license=('MIT')
depends=('postgresql>12' 'postgresql<13' 'uriparser')
source=(${url}archive/${pkgver}.tar.gz)
sha512sums=('166676b5f375e3da6a25242d42c059f35888fb9fa3b72c3d11a0678c23dbcb4f75665c0bbe45a23b65c0cdd1ec2403b0473164b5954bc0dcca2bdc228927ff61')

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/pguri/LICENSE"
}
