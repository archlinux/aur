# Maintainer: <telecommuter@deguco.net>
pkgname=degumail
pkgver=0.1.4
pkgrel=1
pkgdesc="Minimalist mail client written in Go using stdlib"
arch=('x86_64')
url="https://deguco.net/software"
license=('MIT')
depends=()
makedepends=('go')
source=("git+http://git-pub.deguco.net/degumail.git#commit=eb2e0791d8dfe93f7315cb693e3bd16871fd9435")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  CGO_ENABLED=0 go build -ldflags="-s -w" -o degumail main.go read.go send.go delete.go attach.go utils.go
}

package() {
  install -Dm755 "$srcdir/$pkgname/degumail" "$pkgdir/usr/bin/degumail"
}
