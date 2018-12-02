# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Caleb Bassi <calebjbassi@gmail.com>

pkgname=gotop
pkgver=1.6.0
pkgrel=1
pkgdesc='A terminal based graphical activity monitor inspired by gtop and vtop'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/cjbassi/gotop"
license=(AGPL3)
makedepends=(go-pie git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cjbassi/gotop/archive/${pkgver}.tar.gz")
sha256sums=('c55ab94cb3f532cec1a060e4965451dc9e72443dfb4b07bb6579934d5cdb2a7d')

build() {
  cd "$pkgname-$pkgver"
  go build
}

package() {
  install -Dm755 "$pkgname-$pkgver"/gotop $pkgdir/usr/bin/gotop
}
