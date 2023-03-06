# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1.12.4
pkgrel=1
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-jetbrains"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('fd3e700c213ee2ffd8162ba208a142a33f23d518ad6e175fda578cf1ac6cf731')

build() {
    cd "$pkgname-$pkgver"
    export RUSTFLAGS='--cap-lints=allow'
    make PREFIX="/usr" build
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}
