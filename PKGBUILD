pkgname=libjwt
pkgver=1.9.0
pkgrel=1
pkgdesc="JWT C Library"
arch=('i686' 'x86_64')
url="https://github.com/benmcollins/libjwt"
license=('GPL')
depends=('check' 'jansson')
source=("https://github.com/benmcollins/libjwt/archive/v$pkgver.tar.gz")
sha256sums=('cc694dfc3abe17d1f5cde4bf6714e39dc17f7cbad352a85ffb0fe6418c584076')

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
