# Maintainer: Vitor Mariano <vitor.mariano@gmail.com>

pkgname=regex-tui
pkgver=0.3.0
pkgrel=1
pkgdesc="A simple TUI to visualize regular expressions right in your terminal."
arch=(x86_64)
url="https://github.com/vitor-mariano/regex-tui"
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::https://github.com/vitor-mariano/regex-tui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ae9028dbabf20ccc1390299a1545270c46f7146d70581e1f2c57b48f266a16a6')

build() {
    cd "$pkgname-$pkgver"
    make build
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 bin/regex-tui "$pkgdir/usr/bin/regex-tui"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
