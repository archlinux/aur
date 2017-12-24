# Maintainer: Nemo <archlinux [at] captnemo.in>

pkgname=karn
pkgver=0.0.3
pkgrel=1
pkgdesc="Manage multiple Git identities with ease"
arch=('x86_64' 'i686')
url="https://github.com/prydonius/karn"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://github.com/prydonius/karn/archive/v$pkgver.tar.gz")
sha256sums=('a9336abe63dbf6b952e1e4a3d4c31ed62dda69aa51e53f07902edb894638162d')

prepare() {
  GOPATH=`pwd`
  cd "$pkgname-$pkgver"
  go get github.com/codegangsta/cli
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