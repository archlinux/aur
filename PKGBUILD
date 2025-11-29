pkgname=lumus
pkgver=1.0.1
pkgrel=1
pkgdesc="A command line tool to read PDF files directly in the terminal"
arch=('x86_64')
url="https://github.com/Josehpequeno/lumus"
license=('MIT')
depends=('poppler' 'wv' 'unrtf' 'tidy' 'tesseract' 'leptonica')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Josehpequeno/lumus/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    go build -o lumus .
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 lumus "$pkgdir/usr/bin/lumus"
}