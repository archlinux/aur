# Maintainer: Altynbek Orumbayev <aorumbayev@pm.me>
#
# This is the binary package for awesome-omarchy-tui, which provides pre-compiled
# binaries for faster installation. For building from source, see awesome-omarchy-tui.
#
# NOTE: The pre-compiled binaries are built without the updater feature to ensure
# package managers (pacman/AUR) handle updates instead of the application itself.
# This follows standard Linux package management practices and matches both the
# source package configuration and crates.io publishing approach.

pkgname=awesome-omarchy-tui-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A beautiful terminal UI for browsing the awesome-omarchy repository with search, navigation, and GitHub integration (binary package)"
arch=('x86_64')
url="https://github.com/aorumbayev/awesome-omarchy-tui"
license=('MIT')
provides=('awesome-omarchy-tui')
conflicts=('awesome-omarchy-tui')
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::https://github.com/aorumbayev/awesome-omarchy-tui/releases/download/v${pkgver}/awsomarchy-aur-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('f6bfc5f9dd6024338e7798e0c7216d3eaf75ff4b2192d5f7e1a74f2cc19f8631')

package() {
    # Install binary (built without updater feature for proper package manager integration)
    install -Dm0755 "$srcdir/awsomarchy" "$pkgdir/usr/bin/awsomarchy"
    
    # Install documentation and license files required by AUR guidelines
    install -Dm0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
