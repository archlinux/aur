# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Caleb Bassi <calebjbassi@gmail.com>

pkgname=gotop
pkgver=1.5.1
pkgrel=1
pkgdesc='A terminal based graphical activity monitor inspired by gtop and vtop'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/cjbassi/gotop"
license=(AGPL3)
makedepends=(go-pie)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cjbassi/gotop/archive/${pkgver}.tar.gz")
sha256sums=('b8729e51b4b885d29328307c68bc55d13e1367e154cafb3cca30b6be99257113')

build() {
  cd "$pkgname-$pkgver"
  go build
}

package() {
  install -Dm755 "$pkgname-$pkgver"/gotop $pkgdir/usr/bin/gotop
}
