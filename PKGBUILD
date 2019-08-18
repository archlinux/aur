# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=webtty
pkgver=0.2.0
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

sha256sums=('895a5097ce649fa226de4cfe8abc8013b074c180704158c7731ff7dcd63231e8')
