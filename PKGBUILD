# Maintainer: Vitor Mariano <vitor.mariano@gmail.com>

pkgname=regex-tui
pkgver=0.6.0
pkgrel=2
pkgdesc="A simple TUI to visualize regular expressions right in your terminal."
arch=(x86_64)
url="https://github.com/vitor-mariano/regex-tui"
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::https://github.com/vitor-mariano/regex-tui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7707bd052859619b03bb8d62521d34ac821d28c8be5160bee7b4c98198d20461')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 bin/regex-tui "$pkgdir/usr/bin/regex-tui"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
