# Maintainer: Gabriel Vasconcelos <gavasc@proton.me>
pkgname=tuidger
pkgver=0.2.5
pkgrel=1
pkgdesc="Terminal personal finance manager"
arch=('x86_64' 'aarch64')
url="https://github.com/gavasc/tuidger"
license=('MIT')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a123f3adb37de8e0b59491cd7dcd44b86a1c1c23b849ef907a56927513c72461')

build() {
    cd "$pkgname-$pkgver"
    go build -ldflags "-s -w -X main.version=$pkgver" -o "$pkgname" .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
