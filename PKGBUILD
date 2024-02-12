# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1.17.0
pkgrel=1
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('x86_64')
url="https://github.com/swsnr/gnome-search-providers-jetbrains"
license=('MPL-2.0')
depends=('gnome-shell')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('195c32a04a9708674ca7ee5ce05c992470168ae6da8ce5e63632f0ef4989954b')

build() {
    cd "${pkgname}-${pkgver}" || return 1
    export RUSTFLAGS='--cap-lints=allow'
    make PREFIX="/usr" build
}

package() {
    cd "${pkgname}-${pkgver}" || return 1
    make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
