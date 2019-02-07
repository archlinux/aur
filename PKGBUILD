# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=ethr
pkgver=0.2.1
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
sha256sums=('05480aec03ab9103786a053cbd25e9d0dc1956149fca65372acda2b5dbd489ae')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install deps
  go get github.com/nsf/termbox-go

  # Build
  go build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/ethr"
}
