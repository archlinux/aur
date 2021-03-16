# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=webtty
pkgver=0.4.1
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

sha256sums=('270cd0862b3a3ad969d09058df3dc845d4ffcbd743345e1329e48599be5a895c')
