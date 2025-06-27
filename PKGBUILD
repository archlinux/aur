# Maintainer: <telecommuter@deguco.net>
pkgname=degumail
pkgver=0.2.0
pkgrel=1
pkgdesc="Minimalist mail client written in Go using stdlib"
arch=('x86_64')
url="https://deguco.net/software"
license=('MIT')
depends=()
makedepends=('go')
source=("git+https://codeberg.org/deguco/degumail.git#commit=8db3381334a1b9e65e716446d5915c0c1b771321")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  CGO_ENABLED=0 go build -ldflags="-s -w" -o degumail main.go read.go send.go delete.go attach.go utils.go
}

package() {
  install -Dm755 "$srcdir/$pkgname/degumail" "$pkgdir/usr/bin/degumail"
}
