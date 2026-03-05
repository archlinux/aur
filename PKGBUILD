# Maintainer: ThiagoAVicente <todo@example.com>
pkgname=hyprexpose-git
pkgver=r0
pkgrel=1
pkgdesc='Lightweight workspace overview for Hyprland with live window thumbnails'
arch=('x86_64')
url='https://github.com/ThiagoAVicente/hyprexpose'
license=('MIT')
depends=('wayland' 'cairo' 'pango' 'hyprland')
makedepends=('git' 'wayland-protocols')
provides=('hyprexpose')
conflicts=('hyprexpose')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd hyprexpose
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd hyprexpose
    make
}

package() {
    cd hyprexpose
    install -Dm755 hyprexpose "$pkgdir/usr/bin/hyprexpose"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
