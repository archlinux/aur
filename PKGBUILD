# Maintainer: Vitor Mariano <vitor.mariano@gmail.com>

pkgname=regex-tui
pkgver=0.5.0
pkgrel=1
pkgdesc="A simple TUI to visualize regular expressions right in your terminal."
arch=(x86_64)
url="https://github.com/vitor-mariano/regex-tui"
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::https://github.com/vitor-mariano/regex-tui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9de3dbc9b28bc19d6cc14040c5086152f7d4d1ea099358cd2022d4607a009de0')

build() {
    cd "$pkgname-$pkgver"
    make build
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 bin/regex-tui "$pkgdir/usr/bin/regex-tui"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
