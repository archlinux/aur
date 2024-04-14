# Maintainer: 6-6-6 <33645950+6-6-6@users.noreply.github.com>
# AUR Maintainer: huggy <arch@huggy.moe>
# Contributor: Zhang Zongyu <zongyu@novazy.net>

pkgname=swan-updown
pkgver=0.3.0
pkgrel=1
pkgdesc="swan-updown helps create XFRM interfaces on demand"
arch=('x86_64' 'aarch64')
url="https://github.com/6-6-6/swan-updown"
license=('MIT')
makedepends=('cargo')

source=("https://github.com/6-6-6/swan-updown/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('d01d5c88bdc30244cece300183aba2ad38c04a161fb9d45fdc6a59a53a71d74974a59e08e17fdceed58d641fe069969532d37ac5dd5fdbe591059adb33163cca')
build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "${pkgdir}/usr/bin/${pkgname}"
}