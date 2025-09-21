# Maintainer: Byson94 <byson94wastaken@gmail.com>
pkgname=ewwii
pkgver=0.1.4
pkgrel=1
pkgdesc="Powerful and flexible widget system for Linux"
arch=('x86_64')
url="https://github.com/Ewwii-sh/ewwii"
license=('GPL')
depends=()
makedepends=('cargo')
provides=('ewwii')
conflicts=('ewwii-bin' 'ewwii')
source=("https://github.com/Ewwii-sh/ewwii/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9eb9348ad043c837c493980686c6dcc36a6bc90f596f401818acbfd443292d00')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -Dm755 "target/release/ewwii" "$pkgdir/usr/bin/ewwii"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
