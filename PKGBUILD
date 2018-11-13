# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Caleb Bassi <calebjbassi@gmail.com>

pkgname=gotop
pkgver=1.5.0
pkgrel=1
pkgdesc='A terminal based graphical activity monitor inspired by gtop and vtop'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/cjbassi/gotop"
license=(AGPL3)
makedepends=(go-pie)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cjbassi/gotop/archive/${pkgver}.tar.gz")
sha256sums=('8ab7c76130a0e9f038e48ddc6496c54cb27c898e1c73448e39bef02a24629ef3')

build() {
  cd "$pkgname-$pkgver"
  go build
}

package() {
  install -Dm755 "$pkgname-$pkgver"/gotop $pkgdir/usr/bin/gotop
}
