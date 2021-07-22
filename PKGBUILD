# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=genht
pkgver=1.1.2
pkgrel=1
pkgdesc="a simple generic hash table implementation in C"
url="http://www.repo.hu/projects/genht/"
arch=('i686' 'x86_64')
license=('Unlicense')
depends=('glibc')
source=("http://www.repo.hu/projects/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('8d65f72668b61f7444514c784b0c722c15fa34ec8bcba9d3bd0ab2bea5c1f0ed')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  make GENHT_LDFLAGS="-Wl,-z,now -Wl,-z,relro"
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir/" install
}
