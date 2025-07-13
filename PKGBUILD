# Maintainer: kamisaki
pkgname=hypr-windowrulex
pkgver=1.0.0
pkgrel=1
pkgdesc=" ✨ Enhances Hyprland window management by applying float, size, and move adjustments to dynamic title changes."
arch=('x86_64')
url="https://github.com/xeyossr/hypr-windowrulex"
license=('GPL3')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    go build -o hypr-windowrulex main.go
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    # Install the compiled binary
    install -Dm755 hypr-windowrulex "$pkgdir/usr/bin/hypr-windowrulex"
}
