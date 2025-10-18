# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Smith Dhumbumroong <zodmaner at gmail dot com>

pkgname=unionfs-fuse
pkgver=3.7
pkgrel=1
pkgdesc="A user space unionfs implementation"
arch=('x86_64')
url="https://github.com/rpodgorny/unionfs-fuse"
license=('BSD')
depends=('fuse3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rpodgorny/unionfs-fuse/archive/v${pkgver}.tar.gz")
sha256sums=('026f5302279110ceb7465e5c9e863cd0319ea0dc32ad253d162cf9db0f5e9a81')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make SBINDIR="/bin" DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 "$srcdir"/$pkgname-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

