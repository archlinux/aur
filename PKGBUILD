# Maintainer: MedCy1 <mederick.roge@epitech.eu>
pkgname=wayinhibit
pkgver=1.3.1
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
    "wayinhibit-$pkgver-bin::https://github.com/MedCy1/wayinhibit/releases/download/v$pkgver/wayinhibit-x86_64"
)
source_aarch64=(
    "wayinhibit-$pkgver-bin::https://github.com/MedCy1/wayinhibit/releases/download/v$pkgver/wayinhibit-aarch64"
)
sha256sums=(
    '3e06d995d8708e04900be0010d9f6bf32db963dafb4a4b4b2b418eee257c2ce6'
)
sha256sums_x86_64=(
    '8079b751c7a12024a29f45ad33129298b8be1dc2d114b12ced4c5793cd96616c'
)
sha256sums_aarch64=(
    '596737664918a5511408e9166a0cf19234b3365508e6546f64138bbaf05a8540'
)

package() {
    install -Dm0755 wayinhibit-$pkgver-bin "$pkgdir/usr/bin/$pkgname"
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
