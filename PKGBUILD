# Maintainer: Yusuf Aktepe <yusuf@yusufaktepe.com>

pkgname=leaf-reader-bin
pkgver=0.17.0
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

sha256sums=('123787a91b78b35721c7fd06971875a30dfbd392027ba8cb137d3c4734c0822d'
            '5f1a20f1e044ae6079e3d55bba8576be556faf560ce53aee1bfc13ca79da96bd')
sha256sums_x86_64=('8d302ed3d90649e29cc8063efec2a50f869a13479cde6ff28edb51ab9e40af30')
sha256sums_aarch64=('9f4b5fc9dc44c040a24a8f679e86e689cb039372cfed392987eb6f7f52f139af')

package() {
    install -Dm755 "$srcdir/leaf" "$pkgdir/usr/bin/leaf"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/leaf.zsh" "$pkgdir/usr/share/zsh/site-functions/_leaf"
    install -Dm644 "$srcdir/leaf.fish" "$pkgdir/usr/share/fish/vendor_completions.d/leaf.fish"
}
