# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=route-rnd
pkgver=0.9.2
pkgrel=1
pkgdesc="free/open source, flexible, modular autorouter for Printed Circuit Boards"
url="http://www.repo.hu/projects/route-rnd/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=()
optdepends=()
source=("http://www.repo.hu/projects/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('786b17210a4af88b31a6cc73c73e4f516bbf6ffb23a34ea509f1e074bf8e3c3f')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir/" install
}
