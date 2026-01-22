# Maintainer: Nick Nizovtsev <nizovtsevnv@gmail.com>

pkgname=termide-bin
pkgver=0.10.0
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
sha256sums_x86_64=('80878290737e1ca4c33e21c3c2ffdbb167de8b3faea92c4a7f8d834f15663c2a')
sha256sums_aarch64=('e5343d3994bf0d00d526f9f77fb3492fed6c423f8daf842cedf87b8bad031e49')

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
