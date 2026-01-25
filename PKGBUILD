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
sha256sums=('86fb3da3033ec42f5de3a874420d1fb12d0fc5a05807f382331c3f627d445a99')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    go build -o lumus .
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 lumus "$pkgdir/usr/bin/lumus"
}
