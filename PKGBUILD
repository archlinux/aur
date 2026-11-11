# Maintainer: MedCy1 <mederick.roge@epitech.eu>
pkgname=wayinhibit
pkgver=1.3.2
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
    '549622d71a728bbee4637ec387469b6ca529be90b70294a4777a572974b47baf'
)
sha256sums_x86_64=(
    '797b003b644b4820d3825979d08a45de8cd3dcc39918fe02410e670b8ed37096'
)
sha256sums_aarch64=(
    '545f2e6f6ede152b3ce2708ba315f34d54f5fa13004ce2b90499428135b33721'
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
