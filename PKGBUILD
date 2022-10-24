# Contributor: Lex Black <autumn-wind@web.de>

pkgname=wireguard-go
pkgver=0.0.20220316
pkgrel=1
pkgdesc="Go userspace implementation of WireGuard"
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://git.zx2c4.com/wireguard-go/"
license=('GPL')
makedepends=('go')
source=(https://git.zx2c4.com/wireguard-go/snapshot/wireguard-go-0.0.20220316.tar.xz)
sha1sums=('9dbfef3009dc5da9c9f53a016049261db62c2ab8')


build() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir"
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
