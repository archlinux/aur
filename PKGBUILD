# Maintainer: fk29g <fk29g.uphill912@slmails.com>
pkgname=enola
pkgver=0.4.1
pkgrel=1
pkgdesc="CLI tool to hunt down social media accounts by username across social networks"
arch=("x86_64")
url="https://github.com/TheYahya/enola"
license=("MIT")
makedepends=("go")
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('31bb37586a4175e2b8142bbf106ddc8038d25a3b9cb6c1e19f6c71762cec18b3')

build() {
    cd "$pkgname-$pkgver"
    mkdir -p dist
    go build -o dist/enola ./cmd/enola
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 0755 dist/enola "$pkgdir/usr/bin/enola"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
