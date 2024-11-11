# Maintainer: Keiran keiran0@proton.me
pkgname=gu
pkgver=1.0.0
pkgrel=2
pkgdesc="A simple CLI file uploader and URL shortener written in Go"
arch=('x86_64')
url="https://github.com/KeiranScript/gu"
license=('MIT')
depends=('go' 'git')
makedepends=('go')
source=("git+https://github.com/KeiranScript/gu.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  export GOPATH="$srcdir/gopath"
  export GOROOT="/usr/lib/go"
  export PATH="$PATH:$GOROOT/bin"

  go mod tidy
  go build -o "$pkgname" ./main.go
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
