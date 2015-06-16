# Maintainer: steabert <steabert.arch@runbox.com>
pkgname=ftnchek
pkgver=3.3.1
pkgrel=1
pkgdesc="Static analyzer for Fortran 77 programs"
url="http://www.dsm.fordham.edu/ftnchek/"
arch=('x86_64' 'i686')
license=('MIT')
depends=()
makedepends=()
optdepends=()
conflicts=()
source=("$url/download/$pkgname-$pkgver.tar.gz")
md5sums=('e1f4ce51ea1a85e7b080ab5d23013f97')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make prefix="$pkgdir"/usr install 
  install -D -m 644 -p LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

