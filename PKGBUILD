# Maintainer: robogg133 < see git.opentty.xyz/robogg133 >
pkgname=utctimerightnow
pkgver=1.0.0
pkgrel=1
pkgdesc="Print real time UTC time"
arch=('x86_64')
url="https://git.opentty.xyz/robogg133/utctimerightnow"
license=('MIT')
makedepends=('go' 'git')
sha256sums=('SKIP')

source=("git+https://git.opentty.xyz/robogg133/$pkgname.git")


build() {
    export GOPATH="$srcdir"/gopath
    cd "$srcdir/$pkgname"
    go build -trimpath -ldflags="-s -w" -o utctimerightnow main.go
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 utctimerightnow "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
