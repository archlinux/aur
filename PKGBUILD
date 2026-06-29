# Maintainer: MedCy1 <mederick.roge@epitech.eu>
pkgname=wayinhibit
pkgver=0.6.2
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
    'facc8adedef10599b5d8fec66fc21419371eb7e666f1a44c618ae3832551ddc3'
)
sha256sums_x86_64=(
    '444307b19359f392d937ea255bc7982e3696ef5d66e7e7a230ab6adef604f1b6'
)
sha256sums_aarch64=(
    'ab13a4ebe30a8a5ef75ed8c6595ae895809eb595b9af4ebf70c0f153ee32e198'
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
