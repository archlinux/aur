# Maintainer: Altynbek Orumbayev <aorumbayev@pm.me>
#
# This is the binary package for awesome-omarchy-tui, which provides pre-compiled
# binaries for faster installation. For building from source, see awesome-omarchy-tui.

pkgname=awesome-omarchy-tui-bin
pkgver=0.3.8
pkgrel=1
pkgdesc="A beautiful terminal UI for browsing the awesome-omarchy repository with search, navigation, and GitHub integration (binary package)"
arch=('x86_64')
url="https://github.com/aorumbayev/awesome-omarchy-tui"
license=('MIT')
provides=('awesome-omarchy-tui')
conflicts=('awesome-omarchy-tui')
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::https://github.com/aorumbayev/awesome-omarchy-tui/releases/download/v${pkgver}/awsomarchy-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('d9a4b1bbba180d63629cefff93918bc271a4bdae397f800c4c0c04e7471e0c6a')

package() {
    # Install binary
    install -Dm0755 "$srcdir/awsomarchy" "$pkgdir/usr/bin/awsomarchy"
    
    # Install documentation and license files required by AUR guidelines
    install -Dm0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
