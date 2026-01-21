# Maintainer: Nick Nizovtsev <nizovtsevnv@gmail.com>

pkgname=termide-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="Cross-platform terminal IDE, file manager and virtual terminal (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/termide/termide"
license=('MIT')
depends=('gcc-libs')
provides=('termide')
conflicts=('termide')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/termide/termide/releases/download/$pkgver/termide-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/termide/termide/releases/download/$pkgver/termide-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('0442c70ef204d87c0951c4af3a6de1051d7591e1d56da1be0df85f731f530d8d')
sha256sums_aarch64=('f3c687735d975df923bf49c93a0305082200726178973fb6660150fc06d345d2')

package() {
    # Install binary
    install -Dm755 termide "$pkgdir/usr/bin/termide"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/termide/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/termide/LICENSE"

    # Install help files
    install -Dm644 help/en.txt "$pkgdir/usr/share/termide/help/en.txt"
    install -Dm644 help/ru.txt "$pkgdir/usr/share/termide/help/ru.txt"
}
