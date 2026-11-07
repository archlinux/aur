# Maintainer: Vitor Mariano <vitor.mariano@gmail.com>

pkgname=regex-tui
pkgver=0.8.0
pkgrel=1
pkgdesc="A simple TUI to visualize regular expressions right in your terminal."
arch=(x86_64)
url="https://github.com/vitor-mariano/regex-tui"
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::https://github.com/vitor-mariano/regex-tui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3204d43aa8cbf8132ba7a52e6c08fc9ac85a4e2fdf98c7a676e985bf24d7ead1')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 bin/regex-tui "$pkgdir/usr/bin/regex-tui"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
