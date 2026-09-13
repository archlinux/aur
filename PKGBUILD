# Maintainer: Nick Nizovtsev <nizovtsevnv@gmail.com>

pkgname=termide-bin
pkgver=0.35.0
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
sha256sums_x86_64=('b58c7b41500e134533a1ed0cf6221db29aa415740b5fd0cff0b7ebff40b9d73f')
sha256sums_aarch64=('62d26a8b0de9df0bb9ffbbaa94179548971fd8177f04fa0a17f25353f2d62ecf')

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
