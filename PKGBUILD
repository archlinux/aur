# Maintainer: MedCy1 <mederick.roge@epitech.eu>
pkgname=wayinhibit
pkgver=1.2.1
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
    '0370ade35aeaf713cf8c0bbcb4f56997b0d68f861cb686f65ad214b678dc54e2'
)
sha256sums_x86_64=(
    '28b0003a5244e3166558426c3f3f68c3ba9b1d12b49b9c5fb91d4be9f112fbab'
)
sha256sums_aarch64=(
    '7708f32728f8f6e99bfadb28857fc7a934717935df162281077a174f336ae665'
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
