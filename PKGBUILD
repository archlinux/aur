# Maintainer: MedCy1 <mederick.roge@epitech.eu>
pkgname=wayinhibit
pkgver=1.0.0
pkgrel=1
pkgdesc="A small Wayland idle inhibitor written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/MedCy1/wayinhibit"
license=('MIT')
depends=('glibc' 'gcc-libs')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/MedCy1/wayinhibit/archive/refs/tags/v$pkgver.tar.gz"
)
source_x86_64=(
    "wayinhibit-bin::https://github.com/MedCy1/wayinhibit/releases/download/v$pkgver/wayinhibit-x86_64"
)
source_aarch64=(
    "wayinhibit-bin::https://github.com/MedCy1/wayinhibit/releases/download/v$pkgver/wayinhibit-aarch64"
)
sha256sums=(
    '91a7c94731dcfdf814bfc4fe65d472bda5533ed3fafa0b74acd0f5a963f26f80'
)
sha256sums_x86_64=(
    'cd99164f59f931a0d8391367499066e97b5f8e8dc23e96ab32b99eaf6b2bdc7c'
)
sha256sums_aarch64=(
    'f355d12193fe88eba1dad196397072653bb7eb20dab85cb9754d64adddd8d3c9'
)

package() {
    install -Dm0755 wayinhibit-bin "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "$pkgname-$pkgver/completions/wayinhibit.bash" \
        "$pkgdir/usr/share/bash-completion/completions/wayinhibit"
    install -Dm0644 "$pkgname-$pkgver/completions/_wayinhibit" \
        "$pkgdir/usr/share/zsh/site-functions/_wayinhibit"
    install -Dm0644 "$pkgname-$pkgver/completions/wayinhibit.fish" \
        "$pkgdir/usr/share/fish/vendor_completions.d/wayinhibit.fish"
    install -Dm0644 "$pkgname-$pkgver/man/wayinhibit.1" \
        "$pkgdir/usr/share/man/man1/wayinhibit.1"
    gzip -9 "$pkgdir/usr/share/man/man1/wayinhibit.1"
}
