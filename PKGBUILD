# Maintainer: OverShifted <prowidgs@gmail.com>

_pkgname=wlipman
pkgname=$_pkgname-git
pkgver=r9
pkgrel=1
pkgdesc="A simple clipboard manager for wayland."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/OverShifted/wlipman"
license=('GPL3')
depends=('gcc-libs' 'rofi')
makedepends=('git' 'cargo')
# conflicts=('wlipman')
provides=('wlipman')
source=("git+https://github.com/OverShifted/$_pkgname.git")
sha384sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    echo r$(git rev-list --count HEAD)
}

build() {
    cd "$_pkgname"
    cargo build --release --target-dir target
}

package() {
    install -Dm755 "$_pkgname/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
