# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Smith Dhumbumroong <zodmaner at gmail dot com>

pkgname=unionfs-fuse
pkgver=3.6
pkgrel=1
pkgdesc="A user space unionfs implementation"
arch=('x86_64')
url="https://github.com/rpodgorny/unionfs-fuse"
license=('BSD')
depends=('fuse3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rpodgorny/unionfs-fuse/archive/v${pkgver}.tar.gz")
sha256sums=('e6c9fac4e0f0ca82b3e515ca2c82c07dc51ed6da168c465c4b6f50c47bfeddd7')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make SBINDIR="/bin" DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 "$srcdir"/$pkgname-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

