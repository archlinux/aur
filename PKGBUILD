# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=ethr
pkgver=0.1
pkgrel=1
pkgdesc="Ethr is a Network Performance Measurement Tool for TCP, UDP & HTTP"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Microsoft/Ethr"
license=('MIT')
makedepends=(
  'go'
  'git'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Microsoft/Ethr/archive/v${pkgver}.tar.gz")
sha256sums=('d233fe1c6ae14ddfd38dc883a79bdad520bd24040cbe9d21fa2e9185d873beef')

build() {
  cd "$srcdir/${pkgname^}-$pkgver"

  # Install deps
  go get github.com/nsf/termbox-go

  # Build
  go build
}

package() {
  cd "$srcdir/${pkgname^}-$pkgver"

  install -Dm755 "${pkgname^}-$pkgver" "$pkgdir/usr/bin/ethr"
}
