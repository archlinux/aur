# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=webtty
pkgver=0.5.1
pkgrel=1
pkgdesc='Share a terminal session over WebRTC'
arch=('x86_64')
url="https://github.com/maxmcd/webtty"
license=('MIT')
makedepends=('go')
source=("https://github.com/maxmcd/webtty/archive/v${pkgver}.tar.gz")

build() {
  cd $pkgname-$pkgver
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}

sha256sums=('681e5d5e93ec3643d2868965c5d0efffdeed263f15c3287cb3218cd243969f60')
