# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Smith Dhumbumroong <zodmaner at gmail dot com>

pkgname=unionfs-fuse
pkgver=3.3
pkgrel=1
pkgdesc="A user space unionfs implementation"
arch=('x86_64')
url="https://github.com/rpodgorny/unionfs-fuse"
license=('BSD')
depends=('fuse3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rpodgorny/unionfs-fuse/archive/v${pkgver}.tar.gz")
sha256sums=('4cf39954d26a585a399d0fc12edf826f38d630f50669c2fe954853ec9d6eeb88')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make SBINDIR="/bin" DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 "$srcdir"/$pkgname-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

