# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Smith Dhumbumroong <zodmaner at gmail dot com>

pkgname=unionfs-fuse
pkgver=3.5
pkgrel=1
pkgdesc="A user space unionfs implementation"
arch=('x86_64')
url="https://github.com/rpodgorny/unionfs-fuse"
license=('BSD')
depends=('fuse3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rpodgorny/unionfs-fuse/archive/v${pkgver}.tar.gz")
sha256sums=('d33bddea64d4974387a8c88292f5a8424bac5da1cf8b7f4f394c803305de73f3')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make SBINDIR="/bin" DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 "$srcdir"/$pkgname-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

