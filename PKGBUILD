# Maintainer: Altynbek Orumbayev <aorumbayev@pm.me>
#
# This is the binary package for LazyLora, which provides pre-compiled
# binaries for faster installation. For building from source, see lazylora.

pkgname=lazylora-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Unofficial terminal user interface for Algorand Blockchain exploration (binary package)"
arch=('x86_64')
url="https://github.com/aorumbayev/lazylora"
license=('MIT')
provides=('lazylora')
conflicts=('lazylora')
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::https://github.com/aorumbayev/lazylora/releases/download/v${pkgver}/lazylora-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('fdc34e9d0b2e10dda012267b752aa93025cd6609b68f9d9a51db557259e32eca')

package() {
    # Install binary
    install -Dm0755 "$srcdir/lazylora" "$pkgdir/usr/bin/lazylora"

    # Install documentation and license files required by AUR guidelines
    install -Dm0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
