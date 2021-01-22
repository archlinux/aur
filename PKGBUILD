# Maintainer: Mansour Behabadi <mansour@oxplot.com>

pkgname="cstore_fdw"
pkgver=1.7.0
pkgrel=1
pkgdesc="Columnar store for analytics with PostgreSQL"
url="https://citusdata.github.io/cstore_fdw/"
license=("Apache")
arch=('i686' 'x86_64')
depends=('protobuf-c' 'postgresql>=9.3', 'postgresql<13')
source=("https://github.com/citusdata/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('bd8a06654b483d27b48d8196cf6baac0c7828b431b49ac097923ac0c54a1c38c')

build() {
  cd "$pkgname-$pkgver"
  make
}
package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
