# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1.16.0
pkgrel=1
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('x86_64')
url="https://github.com/swsnr/gnome-search-providers-jetbrains"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('aa946fdea4df2db04bddc9db46a4c73edfc4a31360f894714d018ae36ebca18e')

build() {
    cd "${pkgname}-${pkgver}" || return 1
    export RUSTFLAGS='--cap-lints=allow'
    make PREFIX="/usr" build
}

package() {
    cd "${pkgname}-${pkgver}" || return 1
    make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
