pkgname=ggdo
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple sudo-like command written in Go with password caching"
arch=('x86_64')
url="https://codeberg.org/ayonelnx/ggdo"
license=('MIT')
depends=('glibc')
makedepends=('go')
provides=('ggdo')
conflicts=('ggdo')
source=("git+$url.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/ggdo"
    go mod download
    go build -o ggdo main.go
}

package() {
    cd "$srcdir/ggdo"
    install -Dm755 ggdo "$pkgdir/usr/bin/ggdo"
    chmod u+s "$pkgdir/usr/bin/ggdo"
}
