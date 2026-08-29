# Maintainer: Ethan Alexander <ethanjalexander@hotmail.ca>

pkgname="wallpiper-hyprland"
pkgver=2.0.1
pkgrel=1
pkgdesc="Hyprland portal for wallpiper"
arch=('x86_64')
url="https://github.com/shdwmtr/wallpiper"
license=('MIT')
depends=('wallpiper' 'wayland')
makedepends=('git' 'wayland' 'wayland-protocols')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    make build-hyprland
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 build/release/wallpiper-portal-hyprland "$pkgdir/usr/lib/wallpiper/wallpiper-portal-hyprland"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
