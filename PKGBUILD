# Maintainer: Byson94 <byson94wastaken@gmail.com>
pkgname=ewwii-git
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
source=("git+https://github.com/Ewwii-sh/ewwii.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/ewwii"
    git describe --long --tags | sed 's/^v//;s/-/./g'
}

build() {
    cd "$srcdir/ewwii"
    cargo build --release --locked
}

package() {
    cd "$srcdir/ewwii"
    install -Dm755 "target/release/ewwii" "$pkgdir/usr/bin/ewwii"
}
