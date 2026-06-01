# Maintainer: Konrad Wasowicz <exaroth@gmail.com>
pkgname=narrative
pkgver=0.2.0
pkgrel=1
pkgdesc="Terminal streamer for ebooks, websites and other text sources."
arch=('x86_64' 'aarch64')
url="https://github.com/exaroth/narrative"
license=('AGPL')
makedepends=('go>=1.26.0')
source=("https://github.com/exaroth/$pkgname/archive/refs/tags/$pkgver.tar.gz")
md5sums=('92d2c58540275312bdc88840152a4860')

build() {
    cd "$pkgname-$pkgver"
    go build -o build/$pkgname cmd/narrative/main.go
    # make build
}

package() {
    cd "$pkgname-$pkgver"
	install -dm0755 "/$pkgdir/usr/bin"
    install build/"$pkgname" "$pkgdir"/usr/bin
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
