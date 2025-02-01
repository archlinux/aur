# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=route-rnd
pkgver=0.9.3
pkgrel=1
pkgdesc="free/open source, flexible, modular autorouter for Printed Circuit Boards"
url="http://www.repo.hu/projects/route-rnd/"
arch=('x86_64')
license=('GPL2')
depends=()
optdepends=()
source=("http://www.repo.hu/projects/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('0cba858e5047246d66c70f2c2948cc626def5296c68fab3c8b978aa31159c33b')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir/" install
}
