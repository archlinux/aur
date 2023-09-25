# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Smith Dhumbumroong <zodmaner at gmail dot com>

pkgname=unionfs-fuse
pkgver=3.4
pkgrel=1
pkgdesc="A user space unionfs implementation"
arch=('x86_64')
url="https://github.com/rpodgorny/unionfs-fuse"
license=('BSD')
depends=('fuse3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rpodgorny/unionfs-fuse/archive/v${pkgver}.tar.gz")
sha256sums=('fc315f13f6ba1a736eab86981dde2ad417926f61cec5eff23bcaeca93235377c')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make SBINDIR="/bin" DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 "$srcdir"/$pkgname-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

