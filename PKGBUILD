# Maintainer: Nemo <archlinux [at] captnemo.in>

pkgname=karn
pkgver=0.0.4
pkgrel=1
pkgdesc="Manage multiple Git identities with ease"
arch=('x86_64' 'i686')
url="https://github.com/prydonius/karn"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://github.com/prydonius/karn/archive/v$pkgver.tar.gz")
sha256sums=('68d244558ef62cf1da2b87927a0a2fbf907247cdd770fc8c84bf72057195a6cb')

prepare() {
  GOPATH=`pwd`
  cd "$pkgname-$pkgver"
  go get github.com/urfave/cli
}

build() {
  GOPATH=`pwd`
  cd "$pkgname-$pkgver"
  go build cmd/karn/karn.go
}

package() {
  ls -la
  install -Dm755 "$pkgname-$pkgver/karn" "$pkgdir/usr/bin/$pkgname"
}