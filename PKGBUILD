# Maintainer: Ethan Alexander <ethanjalexander@hotmail.ca>

pkgname="wallpiper-sway"
pkgver=2.0.1
pkgrel=1
pkgdesc="Sway portal for wallpiper"
arch=('x86_64')
url="https://github.com/shdwmtr/wallpiper"
license=('MIT')
depends=('wallpiper' 'wayland')
makedepends=('git' 'wayland' 'wayland-protocols')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    make build-sway
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 build/release/wallpiper-portal-sway "$pkgdir/usr/lib/wallpiper/wallpiper-portal-sway"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
