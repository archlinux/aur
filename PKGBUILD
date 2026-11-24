# Maintainer: Yusuf Aktepe <yusuf@yusufaktepe.com>

pkgname=leaf-reader-bin
pkgver=0.18.1
pkgrel=1
pkgdesc="Read PDFs, markdown files and web articles in the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/DeepanshuMishraa/leaf"
license=('MIT')
depends=('glibc' 'gcc-libs' 'alsa-lib')

_url_raw="https://raw.githubusercontent.com/DeepanshuMishraa/leaf/v$pkgver"

source=(
    "leaf.zsh::$_url_raw/completions/_leaf"
    "leaf.fish::$_url_raw/completions/leaf.fish"
)

source_x86_64=(
    "$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/leaf-x86_64-unknown-linux-gnu.tar.gz"
)

source_aarch64=(
    "$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/leaf-aarch64-unknown-linux-gnu.tar.gz"
)

sha256sums=('0b9061b1466d89d1c0163b4d84859adc5b2f3e1a0e5e0bf97546ad6cdbf0c30e'
            'abf5af1920d187947b9093f6379b8b0a48f1bd05222b2c30c94f2d424de6c6e2')
sha256sums_x86_64=('66528523582f42e5e083d8edf91e839f28d949ab37972961719a645455625807')
sha256sums_aarch64=('e0b506679a32a07a844f160cd6d61c9972c8f90b5cf6ab650fa17fbda33be8e3')

package() {
    install -Dm755 "$srcdir/leaf" "$pkgdir/usr/bin/leaf"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/leaf.zsh" "$pkgdir/usr/share/zsh/site-functions/_leaf"
    install -Dm644 "$srcdir/leaf.fish" "$pkgdir/usr/share/fish/vendor_completions.d/leaf.fish"
}
