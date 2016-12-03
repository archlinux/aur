pkgname=libjwt
pkgver=1.7.2
pkgrel=1
pkgdesc="JWT C Library"
arch=('i686' 'x86_64')
url="https://github.com/benmcollins/libjwt"
license=('GPL')
depends=('check' 'jansson')
source=("https://github.com/benmcollins/libjwt/archive/v$pkgver.tar.gz")
sha256sums=('fd379e2255c5563657fd231e6260528ad78d29b65b623a5b0637dcdcf0d898e4')

build() {
  cd "$pkgname-$pkgver"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
