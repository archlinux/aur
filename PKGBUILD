# Maintainer: 6-6-6 <33645950+6-6-6@users.noreply.github.com>
# AUR Maintainer: huggy <arch@huggy.moe>
# Contributor: Zhang Zongyu <zongyu@novazy.net>

pkgname=swan-updown
pkgver=0.3.1
pkgrel=1
pkgdesc="swan-updown helps create XFRM interfaces on demand"
arch=('x86_64' 'aarch64')
url="https://github.com/6-6-6/swan-updown"
license=('MIT')
makedepends=('cargo')

source=("https://github.com/6-6-6/swan-updown/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('edfe6518a8f6274fab145aae2ab1be35d649595713299f099472218f0282f57b01886e8a31a93df91d9f6b72be877a04851975e49d15e47fa59bc6a0c36b39b0')
build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "${pkgdir}/usr/bin/${pkgname}"
}
