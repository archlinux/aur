# Maintainer: nicknb <nicknb at posteo dot com>
pkgname=enola
pkgver=0.4.2
pkgrel=1
pkgdesc="CLI tool to hunt down social media accounts by username across social networks"
arch=("x86_64")
url="https://github.com/TheYahya/enola"
license=("MIT")
makedepends=("go")
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c48b934d95e1b6006ddac422a689e2d67d8bd81f2b47a4d75389483ad3644520')

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
