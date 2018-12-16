pkgname=libjwt
pkgver=1.10.0
pkgrel=1
pkgdesc="JWT C Library"
arch=('i686' 'x86_64')
url="https://github.com/benmcollins/libjwt"
license=('GPL')
depends=('check' 'jansson')
source=("https://github.com/benmcollins/libjwt/archive/v$pkgver.tar.gz")
sha256sums=('93b399f829cde5f5a232612fcb2909d63e7a9530bcaef40491a0493ba1606565')

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
