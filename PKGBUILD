# Maintainer: nicknb <nicknb at posteo dot com>
pkgname=enola
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI tool to hunt down social media accounts by username across social networks"
arch=("x86_64")
url="https://github.com/TheYahya/enola"
license=("MIT")
makedepends=("go")
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b5dc8aa505305ccc387ef1ced54a2f356f6c547de38dcefe03ce9533f660aafb')

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
