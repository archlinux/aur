# Maintainer: Mansour Behabadi <mansour@oxplot.com>

pkgname="cstore_fdw"
pkgver=1.6.0
pkgrel=1
pkgdesc="Columnar store for analytics with PostgreSQL"
url="https://github.com/citusdata/cstore_fdw"
license=("Apache")
arch=('i686' 'x86_64')
depends=('protobuf-c' 'postgresql>=9.3')
source=("https://github.com/citusdata/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e95a3ada47b2a0f72f8fb5906c2aa6e0e1d7c4933e4d435943234f85715b48fd')

build() {
  cd "$pkgname-$pkgver"
  make
}
package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
