# Maintainer: hina <192247746+Hinikaa@users.noreply.github.com>
pkgname=tileroot
pkgver=0.5.1
pkgrel=1
pkgdesc="Save and restore tiling WM layouts across sway, Hyprland, and i3"
arch=('x86_64')
url="https://github.com/Hinikaa/tileroot"
license=('MIT')
depends=('glibc' 'libstdc++' 'libgcc' 'libx11')
makedepends=('gcc' 'make' 'nlohmann-json')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Hinikaa/tileroot/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b9f23ec5a34ce5ce33dea5a67bc45a29121cd44acda5e8c8bacdca3a1a53e710')

build() {
    cd "$pkgname-$pkgver"
    make tileroot
}

check() {
    cd "$pkgname-$pkgver"
    make test
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 tileroot "$pkgdir/usr/bin/tileroot"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 completions/tileroot.bash "$pkgdir/usr/share/bash-completion/completions/tileroot"
    install -Dm644 completions/tileroot.zsh "$pkgdir/usr/share/zsh/site-functions/_tileroot"
    install -Dm644 completions/tileroot.fish "$pkgdir/usr/share/fish/vendor_completions.d/tileroot.fish"
}
