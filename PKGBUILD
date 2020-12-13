# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=ethr
pkgver=1.0.0
pkgrel=1
pkgdesc="Ethr is a Network Performance Measurement Tool for TCP, UDP & HTTP"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Microsoft/ethr"
license=('MIT')
makedepends=(
  'go'
  'git'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Microsoft/ethr/archive/v${pkgver}.tar.gz")
sha256sums=('c4bf9d6d4e0659f491b6de6d66ddfe3735d8f6fa791debe9e8bfe0aa0e93ddd3')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Build
  go build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/ethr"
}
