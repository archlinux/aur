# Maintainer: Nick Nizovtsev <nizovtsevnv@gmail.com>

pkgname=termide-bin
pkgver=0.43.0
pkgrel=1
pkgdesc="All-in-one terminal workspace: editor, file manager, terminal, git and coding agent (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/termide/termide"
license=('MIT')
depends=('gcc-libs')
provides=('termide')
conflicts=('termide')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/termide/termide/releases/download/$pkgver/termide-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/termide/termide/releases/download/$pkgver/termide-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a44f67b7e4cf694a43c78cafb2e4d84be1ee8df7e4019d259f8124e41ba7edad')
sha256sums_aarch64=('8308a1ca38ff9c1e6f15f256740867c4511e7ffd8f57d40db8f6527cec9f70ca')

package() {
    # Install binary
    install -Dm755 termide "$pkgdir/usr/bin/termide"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/termide/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/termide/LICENSE"

    # Install shell completions (shipped in the release tarball)
    install -Dm644 completions/termide.bash "$pkgdir/usr/share/bash-completion/completions/termide"
    install -Dm644 completions/_termide "$pkgdir/usr/share/zsh/site-functions/_termide"
    install -Dm644 completions/termide.fish "$pkgdir/usr/share/fish/vendor_completions.d/termide.fish"
}
