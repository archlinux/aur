pkgname=mailc
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple Go CLI mail tool"
arch=('x86_64')
url="https://github.com/uvns/mailc"
license=('MIT')

makedepends=('go')

source=("git+https://github.com/uvns/mailc")
sha256sums=('SKIP')

build() {
cd "$srcdir/mailc"
go build -ldflags="-s -w" -o mailc .
}

package() {
cd "$srcdir/mailc"
install -Dm755 mailc "$pkgdir/usr/bin/mailc"
}

