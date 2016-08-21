pkgname=libjwt
pkgver=1.3.1
pkgrel=1
pkgdesc="JWT C Library"
arch=('i686' 'x86_64')
url="https://github.com/benmcollins/libjwt"
license=('GPL')
depends=('check' 'jansson')
source=("https://github.com/benmcollins/libjwt/archive/v$pkgver.tar.gz")
sha256sums=('5f43af415412b6448760946643f2666a65e4e0559a5c893316d7e98520d78b1a')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
