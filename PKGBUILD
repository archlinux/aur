pkgname=libjwt
pkgver=1.6.0
pkgrel=1
pkgdesc="JWT C Library"
arch=('i686' 'x86_64')
url="https://github.com/benmcollins/libjwt"
license=('GPL')
depends=('check' 'jansson')
source=("https://github.com/benmcollins/libjwt/archive/v$pkgver.tar.gz")
sha256sums=('0044f8188dd1e079f815f78a0db71f75d66631a651e9a4ae36d1a958ddb94e45')

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
