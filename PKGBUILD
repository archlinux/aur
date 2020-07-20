# Maintainer: Temuri Takalandze <takalandzet@gmail.com>
pkgname=goclockify
pkgver=1.0.0
pkgrel=1
pkgdesc='A terminal based client for Clockify time tracker'
arch=('x86_64')
url='https://github.com/ABGEO/goclockify'
license=('MIT')
makedepends=('go' 'git' 'make')
source=('git+https://github.com/ABGEO/goclockify.git')
sha256sums=('SKIP')

prepare(){
  cd $pkgname
  mkdir -p build/
}

pkgver() {
    cd $pkgname
    go run main.go --version
}

build() {
  cd $pkgname
  make build-linux-binary
}

package() {
  cd $pkgname
  install -Dm755 build/$pkgname-$pkgver-linux-amd64 "$pkgdir"/usr/bin/$pkgname
}
