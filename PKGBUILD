# Maintainer: fk29g <fk29g.uphill912@slmails.com>
pkgname=codegrab
pkgver=1.1.0
pkgrel=2
pkgdesc="CLI and TUI for selecting and bundling code into a single, LLM-ready output file"
arch=("x86_64")
url="https://github.com/epilande/codegrab"
license=("MIT")
makedepends=("go")
provides=("codegrab")
conflicts=("codegrab")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('d7b71559cd50d0f3c271698a9d27c3ab8f6b3cf52469661ff2a890f8e6017f4019ab6257bae4820b4b848592ac0b7061cbe0702d6c3ac702d103df4a54f118ab')

build() {
    cd "$pkgname-$pkgver"
    go build ./cmd/grab
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 grab "$pkgdir/usr/bin/grab"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
