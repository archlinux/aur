pkgname=jml
pkgver=1.3.1
pkgrel=2
pkgdesc="Testing hybridization using species trees https://doi.org/10.1111/j.1755-0998.2011.03065.x"
arch=(x86_64)
url="https://github.com/simjoly/jml"
license=('GPL3')
makedepends=('make' 'gcc')
source=("$pkgname-$pkgver::$url/archive/v${pkgver}.tar.gz")
md5sums=('39d2beae56982e75e68cc06ce5c571f7')

build() {
  cd $pkgname-${pkgver}
  cd src
  make
}

package() {
  cd $pkgname-$pkgver
  cd src
  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
}
