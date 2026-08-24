# Maintainer: Ethan Alexander <ethanjalexander@hotmail.ca>

pkgname="wallpiper-i3"
pkgver=1.1.0
pkgrel=1
pkgdesc="i3wm portal for wallpiper"
arch=('x86_64')
url="https://github.com/shdwmtr/wallpiper"
license=('MIT')
depends=('wallpiper' 'libxcb')
makedepends=('git' 'libxcb')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    make build-i3
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 target/release/wallpiper-portal-i3 "$pkgdir/usr/lib/wallpiper/wallpiper-portal-i3"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
