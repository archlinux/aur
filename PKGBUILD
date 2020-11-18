
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=godef
pkgver=1.1.2
pkgrel=1
pkgdesc='Print where symbols are defined in Go source code.'
arch=('x86_64')
url='https://github.com/rogpeppe/godef'
license=('BSD')
depends=('go')
provides=('godef')
conflicts=('godef-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rogpeppe/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    export GOPATH="$srcdir"
    go build -v -o "$pkgname"
}

package() {
    licenses="$pkgdir/usr/share/licenses/$pkgname"

    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$licenses/LICENSE"
}
