# Maintainer: hina <192247746+Hinikaa@users.noreply.github.com>
pkgname=tileroot
pkgver=0.5.0
pkgrel=1
pkgdesc="Save and restore tiling WM layouts across sway, Hyprland, and i3"
arch=('x86_64')
url="https://github.com/Hinikaa/tileroot"
license=('MIT')
depends=('glibc' 'libstdc++' 'libgcc' 'libx11')
makedepends=('gcc' 'make' 'nlohmann-json')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Hinikaa/tileroot/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9e1a8cafbb9662e9f6927b10c6809c16a064842ee2cf305d126e150f1c9b6c86')

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
