# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=webtty
pkgver=0.3.0
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

sha256sums=('0946c59c62cb12b663036098911c33df03679aca84d580c479d73eb6f45a220f')
