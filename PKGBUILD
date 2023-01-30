pkgname=pguri
pkgver=1.20151224
pkgrel=10
pkgdesc="uri data type for PostgreSQL"
arch=('i686' 'x86_64')
url="https://github.com/petere/pguri/"
license=('MIT')
makedepends=('llvm')
depends=('postgresql>15' 'postgresql<16' 'uriparser')
source=(${url}archive/${pkgver}.tar.gz)
b2sums=('f88707d8751c91221861afd287de77eb4cea44852856b17d28753d6f899eebeb1192d410d43b98d991d6e92a4670b9e1eca55052cbf5305b864a5873a768373a')

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/pguri/LICENSE"
}
