# Contributor: Lex Black <autumn-wind@web.de>

pkgname=wireguard-go
pkgver=0.0.20230223
pkgrel=1
pkgdesc="Go userspace implementation of WireGuard"
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://git.zx2c4.com/wireguard-go/"
license=('GPL')
makedepends=('go')
source=(https://git.zx2c4.com/wireguard-go/snapshot/${pkgname}-${pkgver}.tar.xz)
sha1sums=('9e53afd8d58a176b136d337d42ba109d71c11926')


build() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir"
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
