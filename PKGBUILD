# Maintainer: hina <192247746+Hinikaa@users.noreply.github.com>
pkgname=tileroot
pkgver=0.2.0
pkgrel=1
pkgdesc="Save and restore tiling WM layouts across sway, Hyprland, and i3"
arch=('x86_64')
url="https://github.com/Hinikaa/tileroot"
license=('MIT')
depends=('nlohmann-json' 'gcc-libs' 'libx11')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Hinikaa/tileroot/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('178276dd9d6d561ef6fca406522e28b3a9130c3800f71ea9bbda2b20b2f77244')

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
